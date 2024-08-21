create or replace package body com_api_label_pkg is

G_PARAMETERS apex_exec.t_parameters;

procedure set_parameters(
    p_parameters in apex_exec.t_parameters
) is
begin
    G_PARAMETERS := p_parameters;
end;

function get_parameters
  return apex_exec.t_parameters
is
begin
    return G_PARAMETERS;
end;

procedure get_label(
    o_label      out clob
  , p_label_id   in  number
  , p_parameters in  apex_exec.t_parameters
) is
    l_func_name  varchar2(264);
    l_param_name varchar2(4000);
    l_param_val  varchar2(4000);
    l_exec       varchar2(4000);
    
    /*Тип переменной t_parameters указан в виде числа от 1 до 12*/
    l_param_func     type_varchar_list := type_varchar_list(
                                               'apex_exec.get_parameter_varchar2'       --1
                                             , 'apex_exec.get_parameter_number'         --2
                                             , 'apex_exec.get_parameter_date'           --3
                                             , 'apex_exec.get_parameter_timestamp'      --4
                                             , 'apex_exec.get_parameter_timestamp_tz'   --5
                                             , 'apex_exec.get_parameter_timestamp_ltz'  --6
                                             , 'apex_exec.get_parameter_interval_y2m'   --7
                                             , 'apex_exec.get_parameter_interval_d2s'   --8
                                             , 'com_api_utils_pkg.get_parameter_blob'   --9
                                             , 'com_api_utils_pkg.get_parameter_bfile'  --10
                                             , 'apex_exec.get_parameter_clob'           --11
                                             , 'com_api_utils_pkg.get_parameter_anydate'--12
                                           );
                                           
    function get_label_func(
        p_label_id in number
    ) return varchar2 
    is
        l_func varchar2(256);
    begin
        select t.label_func
          into l_func
          from print_label_template t
         where t.label_id = p_label_id;
         
        return l_func;
    exception
        when no_data_found then
            com_api_error_pkg.raise_app_error(
                p_message => 'Шаблон для формирования этикетки не найден!'
            );
    end;
    
    procedure chk_param_name(
        p_param_name in varchar2
    ) is
    begin
        if regexp_like(p_param_name, ';| ') then
            com_api_error_pkg.raise_app_error(
                p_message => 'Не верное указание переменной ['||p_param_name||']!'
            );
        end if;
    end;
begin
    l_func_name := get_label_func(p_label_id);
    set_parameters(p_parameters);
    
    /*Чтобы обезопасить себя от SQL инъекций используем привязку парамтеров через bind переменные*/
    for i in 1..p_parameters.count loop
        chk_param_name(p_parameters(i).name);   
    
        l_param_name := l_param_name||', '||p_parameters(i).name||' => '||':par'||i;
        l_param_val  := l_param_val||', '||l_param_func(p_parameters(i).data_type)||'(com_api_label_pkg.get_parameters, '''||p_parameters(i).name||''')';
    end loop;
    
    l_param_name := ltrim(l_param_name, ', ');    
    
    l_exec := q'# 
declare
    l_exec_label clob;
begin
    execute immediate '
    begin
        :label_exec := #'||l_func_name||'('||l_param_name||q'#);
    end;
    '
    using out l_exec_label#'||l_param_val||';
    
    :l_label := l_exec_label;
end;';
 
    execute immediate l_exec
    using out o_label;
end;

function get_label_base64(
    p_label_id    in number
  , p_parameters  in apex_exec.t_parameters default apex_exec.c_empty_parameters
) return clob
as
    l_label      clob;
    l_xml_return clob;    
begin
    get_label(
        o_label      => l_label
      , p_label_id   => p_label_id
      , p_parameters => p_parameters
    );
    
    if l_label is null then
        com_api_error_pkg.raise_app_error(
            p_message => 'Описание шаблона отсутсвует!'
        );
    end if;
    
    l_xml_return := pack_webservice.get_print_label(
                       p_label => l_label
                    );
                    
    return l_xml_return;
end;

function make_label_pdf(
    p_label_id   in number
  , p_parameters in apex_exec.t_parameters default apex_exec.c_empty_parameters
) return blob
as
    l_pdf        blob;
    l_base64     clob;    
begin
    l_base64 := get_label_base64(
                    p_label_id   => p_label_id
                  , p_parameters => p_parameters
                );    
    l_pdf    := apex_web_service.clobbase642blob(l_base64);
    
    return l_pdf;
end;

function get_jobname
  return varchar2
is
begin
    return trunc(sysdate)||'_'||print_lbl_jobname_seq.nextval;
end;

function get_printername
  return varchar2
is
    l_printername varchar2(256);
    l_ip          varchar2(100);
begin
    l_ip := case when user = 'CENTER_APEX' then '0.0.0.0' else owa_util.get_cgi_env('X-FORWARDED-FOR') end;
    
    select datamaxlpr.vdmlpr
      into l_printername
      from center.workplace@center_apex_sunset
      join center.datamaxlpr@center_apex_sunset
        on workplace.iddmlpr = datamaxlpr.iddmlpr
      where workplace.vip = l_ip;
    
    return l_printername;
exception
    when no_data_found then
        com_api_error_pkg.raise_app_error(
            p_message => 'Принтер для печати не найден'
        );
end;

procedure print_label(
    p_label_id   in number
  , p_parameters in apex_exec.t_parameters default apex_exec.c_empty_parameters
  , p_quantity   in number default 1
) as
    l_label       clob;
    l_xml_return  clob;
    l_printername varchar2(256);
begin
    l_printername := get_printername();
    
    get_label(
        o_label      => l_label
      , p_label_id   => p_label_id
      , p_parameters => p_parameters
    );
    
    if l_label is null then
        com_api_error_pkg.raise_app_error(
            p_message => 'Описание шаблона отсутсвует!'
        );
    end if;
    
    l_xml_return := pack_webservice.get_print_label(
                       p_label       => l_label
                     , p_printername => l_printername
                     , p_jobname     => get_jobname
                     , p_quantity    => nvl(p_quantity, 1)
                    );
end;

end com_api_label_pkg;
