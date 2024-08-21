prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>1280701961166788
,p_default_application_id=>110
,p_default_owner=>'CENTER_APEX'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/call_print_label_pdf
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(88523072435666166)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'CALL_PRINT_LABEL_PDF'
,p_display_name=>unistr('\0421\0444\043E\0440\043C\0438\0440\043E\0432\0430\0442\044C PDF \044D\0442\0438\043A\0435\0442\043A\0438')
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function make_pdf (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_ajax_result',
'as',
'    l_base64      clob;',
'    l_parameters  apex_exec.t_parameters := apex_exec.c_empty_parameters;',
'    l_result      apex_plugin.t_dynamic_action_ajax_result;',
'    ',
'    procedure set_parameters(',
'        o_parameters out apex_exec.t_parameters',
'    ) is',
'        l_param_val   varchar2(4000);',
'        l_index       number := 1;',
'        l_new_index   number;',
'    begin',
'        if p_dynamic_action.attribute_05 = ''Y'' then',
unistr('            com_api_label_pkg.set_parameters(apex_exec.c_empty_parameters);         --\0432\044B\0441\0442\0430\0432\043B\044F\0435\043C \043F\0443\0441\0442\044B\043C \0437\043D\0430\0447\0435\043D\0438\0435\043C'),
'            ',
unistr('            apex_exec.execute_plsql(p_dynamic_action.attribute_04); --\0432\044B\043F\043E\043B\043D\044F\0435\043C \0434\0438\043D\0430\043C\0438\0447\0435\0441\043A\0438\0439 pl/sql'),
'            ',
unistr('            o_parameters := com_api_label_pkg.get_parameters();     --\0411\0435\0440\0435\043C \0442\043E, \0447\0442\043E \043F\043E\043B\0443\0447\0438\043B\043E\0441\044C \0432 \0434\0438\043D\0430\043C\0438\0447\0435\0441\043A\043E\043C pl/sql'),
'        elsif p_dynamic_action.attribute_02 is not null then',
'            l_param_val  := apex_application.g_x01;',
unistr('            l_param_val  := l_param_val||'';''; --regexp_substr \0441 \0448\0430\0431\043B\043E\043D\043E\043C [^;]+ \043D\0435 \0432\043E\0437\044C\043C\0435\0442 \043F\0443\0441\0442\044B\0435 \0437\043D\0430\0447\0435\043D\0438\044F "1;;3" (\043F\043E\0437\0438\0446\0438\044F 2 \0432\0435\0440\043D\0435\0442 \0437\043D\0430\0447\0435\043D\0438\0435 3, \0430 \043D\0430\043C \043D\0443\0436\0435\043D null)'),
'',
'            for i in (',
'                select regexp_substr(param_name, ''[^;]+'', 1, level) param_name',
'                  from (select p_dynamic_action.attribute_02 param_name from dual) ',
'               connect by regexp_instr(param_name, ''[^;]+'', 1, level) > 0',
'            ) loop',
'                l_new_index := instr(l_param_val, '';'', l_index);',
'',
'                apex_exec.add_parameter(o_parameters, i.param_name, substr(l_param_val, l_index, l_new_index - l_index));',
'',
'                l_index := l_new_index + 1;',
'            end loop;',
'        end if;',
'    end;',
'begin',
'    set_parameters(l_parameters);',
'    ',
'    l_base64 := com_api_label_pkg.get_label_base64(',
'                    p_label_id   => p_dynamic_action.attribute_01',
'                  , p_parameters => l_parameters',
'                );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''pdf_base64'', l_base64);',
'    apex_json.close_all;',
'    ',
'    return l_result;',
'end;',
'',
'function render_pdf_label (',
'   p_dynamic_action   in apex_plugin.t_dynamic_action',
' , p_plugin           in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result as',
'    l_result   apex_plugin.t_dynamic_action_render_result;',
'begin',
'    apex_javascript.add_library(',
'        p_name        => ''app_pdf_label''',
'      , p_directory   => p_plugin.file_prefix',
'      , p_version     => null',
'      , p_key         => ''pdf_label_js''',
'    );',
'  ',
'    l_result.attribute_03 := p_dynamic_action.attribute_03;',
'    ',
'    l_result.ajax_identifier     := apex_plugin.get_ajax_identifier;    ',
'    l_result.javascript_function := ''plug_pdf_label'';',
'',
'    return l_result;',
'end render_pdf_label;'))
,p_api_version=>2
,p_render_function=>'render_pdf_label'
,p_ajax_function=>'make_pdf'
,p_standard_attributes=>'WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>8
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(88553064470629995)
,p_plugin_id=>wwv_flow_api.id(88523072435666166)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Template'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(88553365753628483)
,p_plugin_attribute_id=>wwv_flow_api.id(88553064470629995)
,p_display_sequence=>10
,p_display_value=>unistr('\0411\0435\0439\0434\0436 \0441\043E\0442\0440\0443\0434\043D\0438\043A\0430')
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(88563071968620128)
,p_plugin_id=>wwv_flow_api.id(88523072435666166)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Param names'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(89493007756829059)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_examples=>'p_par1;p_par2'
,p_help_text=>unistr('\041F\0435\0440\0435\0447\0438\0441\043B\0438\0442\044C \043F\0430\0440\0430\043C\0435\0442\0440\044B \0434\043B\044F \0444\0443\043D\043A\0446\0438\0438 \0444\043E\0440\043C\0438\0440\0443\044E\0449\0435\0439 \0448\0430\0431\043B\043E\043D \044D\0442\0438\043A\0435\0442\043A\0438. \041F\0435\0440\0435\0447\0438\0441\043B\044F\0442\044C \043F\0430\0440\0430\043C\0435\0442\0440\044B \0447\0435\0440\0435\0437 ";".')
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(88563349115615694)
,p_plugin_id=>wwv_flow_api.id(88523072435666166)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Param values'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(89493007756829059)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(89273007352100253)
,p_plugin_id=>wwv_flow_api.id(88523072435666166)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>50
,p_prompt=>'Init PLSQL code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(89493007756829059)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_parameters     apex_exec.t_parameters := apex_exec.c_empty_parameters;',
'begin',
unistr('    --\043D\0430\0437\0432\0430\043D\0438\044F \043F\0430\0440\0430\043C\0435\0442\0440\043E\0432 \044D\0442\043E \043F\0430\0440\0430\043C\0435\0442\0440\044B \0444\0443\043D\043A\0446\0438\0438, \043A\043E\0442\043E\0440\0430\044F \0444\043E\0440\043C\0438\0440\0443\0435\0442 label'),
'    apex_exec.add_parameter(l_parameters, ''p_par1'', ''val1'');',
'    apex_exec.add_parameter(l_parameters, ''p_par2'', ''val2'');',
'    ',
'    com_api_label_pkg.set_parameters(l_parameters);',
'end;'))
,p_help_text=>unistr('\041D\0443\0436\043D\043E \0441\0444\043E\0440\043C\0438\0440\043E\0432\0430\0442\044C \043F\0430\0440\0430\043C\0435\0442\0440\044B \0438 \0443\0441\0442\0430\043D\043E\0432\0438\0442\044C \0438\0445 \0434\043B\044F \043F\0430\043A\0435\0442\0430 com_api_label_pkg.')
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(89493007756829059)
,p_plugin_id=>wwv_flow_api.id(88523072435666166)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>15
,p_prompt=>'Init on PLSQL'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20706C75675F7064665F6C6162656C2829207B0D0A0976416A61784964656E746966696572203D20746869732E616374696F6E2E616A61784964656E7469666965723B0D0A0976526573756D6543616C6C6261636B203D2074686973';
wwv_flow_api.g_varchar2_table(2) := '2E726573756D6543616C6C6261636B3B0D0A09764461746153657420202020202020203D207B7D3B0D0A090D0A0969662028746869732E616374696F6E2E617474726962757465303329207B0D0A0909764172724974656D73202020203D20746869732E';
wwv_flow_api.g_varchar2_table(3) := '616374696F6E2E61747472696275746530332E73706C697428272C27293B202F2F4954454D28732920706172616D2076616C75650D0A0909764C6162656C506172616D203D2027273B0D0A09090D0A0920202020666F7228696E64657820696E20764172';
wwv_flow_api.g_varchar2_table(4) := '724974656D73297B0D0A202020202020202020202020764C6162656C506172616D203D20764C6162656C506172616D202B20223B22202B20617065782E6974656D28764172724974656D735B696E6465785D292E67657456616C756528293B0D0A202020';
wwv_flow_api.g_varchar2_table(5) := '20202020207D0D0A09090D0A090969662028764C6162656C506172616D29207B0D0A092020202020202020764C6162656C506172616D20203D20764C6162656C506172616D2E7265706C616365282F5E3B2F2C2727293B0D0A0909097644617461536574';
wwv_flow_api.g_varchar2_table(6) := '2E783031203D20764C6162656C506172616D3B202F2FD0BFD0B5D180D0B5D0B0D0B5D0BC20D0BFD0B0D180D0B0D0BCD0B5D182D180D18B20D0B220D0B4D0B0D182D0B0D181D0B5D1820D0A09202020207D0D0A097D0D0A090D0A09617065782E73657276';
wwv_flow_api.g_varchar2_table(7) := '65722E706C7567696E280D0A090976416A61784964656E7469666965722C0D0A090976446174615365742C200D0A09097B200D0A090909737563636573733A2066756E6374696F6E28704461746129207B200D0A090909096C65742070646657696E646F';
wwv_flow_api.g_varchar2_table(8) := '77203D2077696E646F772E6F70656E282222293B0D0A090909090D0A2020202020202020202020202020202070646657696E646F772E646F63756D656E742E7772697465280D0A0909090920202020223C68746D6C3E3C686561643E3C7469746C653E50';
wwv_flow_api.g_varchar2_table(9) := '72696E744C6162656C3C2F7469746C653E3C2F686561643E3C626F6479207374796C653D276D617267696E3A30273E220D0A09090909202020202B20223C696672616D652077696474683D273130302527206865696768743D273130302527207374796C';
wwv_flow_api.g_varchar2_table(10) := '653D27626F726465722D77696474683A3027207372633D27646174613A6170706C69636174696F6E2F7064663B6261736536342C2022202B20656E636F64655552492870446174612E7064665F62617365363429202B2022273E3C2F696672616D653E22';
wwv_flow_api.g_varchar2_table(11) := '0D0A09090909202020202B20223C2F626F64793E3C2F68746D6C3E220D0A20202020202020202020202020202020293B0D0A090909090D0A090909092F2AD0A1D0BED0BED0B1D189D0B0D0B5D0BC20D0BE20D0B2D18BD0BFD0BED0BBD0BDD0B5D0BDD0B8';
wwv_flow_api.g_varchar2_table(12) := 'D0B820D0BFD180D0BED186D0B5D181D181D0B02A2F0D0A09202020202020202020202020617065782E64612E726573756D652876526573756D6543616C6C6261636B2C2066616C7365293B0D0A0909097D2C0D0A2020202020202020202020206572726F';
wwv_flow_api.g_varchar2_table(13) := '723A2066756E6374696F6E28612C622C63297B0D0A09090909636F6E736F6C652E6C6F6728276572726F72205072696E744C6162656C27293B0D0A09090909636F6E736F6C652E6C6F6728612C622C63293B0D0A090909090D0A09090909617065782E6D';
wwv_flow_api.g_varchar2_table(14) := '6573736167652E616C6572742822D09FD180D0B820D184D0BED180D0BCD0B8D180D0BED0B2D0B0D0BDD0B8D0B820D0B4D0BED0BAD183D0BCD0B5D0BDD182D0B020D0BFD180D0BED0B8D0B7D0BED188D0BBD0B020D0BED188D0B8D0B1D0BAD0B02E20D09F';
wwv_flow_api.g_varchar2_table(15) := 'D0BED0BFD180D0BED0B1D183D0B9D182D0B520D181D0BDD0BED0B2D0B020D0BFD0BED0B7D0B4D0BDD0B5D0B52E22293B0D0A090909090D0A090909092F2AD0A1D0BED0BED0B1D189D0B0D0B5D0BC20D0BE20D0B2D18BD0BFD0BED0BBD0BDD0B5D0BDD0B8';
wwv_flow_api.g_varchar2_table(16) := 'D0B820D0BFD180D0BED186D0B5D181D181D0B02A2F0D0A09202020202020202020202020617065782E64612E726573756D652876526573756D6543616C6C6261636B2C2066616C7365293B0D0A0909097D0D0A09097D0D0A09293B200D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(89463301359850305)
,p_plugin_id=>wwv_flow_api.id(88523072435666166)
,p_file_name=>'app_pdf_label.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
