create or replace package com_api_label_pkg is

  -- Author  : ARTEM.SULIMIN
  -- Created : 12.03.2024 12:46:45
  -- Purpose : этикетки в этом пакете формируются через web servis

procedure set_parameters(
    p_parameters in apex_exec.t_parameters
);

function get_parameters
  return apex_exec.t_parameters;

/*
Для заполнения параметров используйте процедуры apex_exec.add_parameter
*/
function get_label_base64(
    p_label_id    in number
  , p_parameters  in apex_exec.t_parameters default apex_exec.c_empty_parameters
) return clob;

function make_label_pdf(
    p_label_id   in number
  , p_parameters in apex_exec.t_parameters default apex_exec.c_empty_parameters
) return blob;

procedure print_label(
    p_label_id   in number
  , p_parameters in apex_exec.t_parameters default apex_exec.c_empty_parameters
  , p_quantity   in number default 1
);

end com_api_label_pkg;
