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
prompt --application/shared_components/plugins/dynamic_action/установить_значение_из_строки_ir
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(70098198323672495)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>unistr('\0423\0421\0422\0410\041D\041E\0412\0418\0422\042C \0417\041D\0410\0427\0415\041D\0418\0415 \0418\0417 \0421\0422\0420\041E\041A\0418 [IR]')
,p_display_name=>unistr('\0423\0441\0442\0430\043D\043E\0432\0438\0442\044C \0437\043D\0430\0447\0435\043D\0438\0435 \0438\0437 \0441\0442\0440\043E\043A\0438 [Interective Report]')
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_set_irr_row_values (',
'   p_dynamic_action   in apex_plugin.t_dynamic_action',
' , p_plugin           in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result as',
'  l_result   apex_plugin.t_dynamic_action_render_result;',
'begin',
'  apex_javascript.add_library(',
'      p_name        => ''app-set-irr-row-values''',
'    , p_directory   => p_plugin.file_prefix',
'    , p_version     => null',
'    , p_key         => ''set_irr_row_values_js''',
'  );',
'  ',
'  l_result.attribute_01        := p_dynamic_action.attribute_01;',
'  l_result.attribute_02        := p_dynamic_action.attribute_02;',
'  l_result.javascript_function := ''set_irr_row_values'';',
'',
'  return l_result;',
'end render_set_irr_row_values;'))
,p_api_version=>2
,p_render_function=>'render_set_irr_row_values'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>unistr('\0412 \043F\043E\043B\0435 "Item (s)", \0443\043A\0430\0437\044B\0432\0430\044E\0442\0441\044F \043F\043E\043B\044F, \0432 \043A\043E\0442\043E\0440\044B\0435 \043D\0443\0436\043D\043E \043F\0440\043E\0441\0442\0430\0432\0438\0442\044C \0437\043D\0430\0447\0435\043D\0438\044F \0438\0437 "jQuery Selector(s)".')
,p_version_identifier=>'1.0'
,p_files_version=>3
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(70098340345675092)
,p_plugin_id=>wwv_flow_api.id(70098198323672495)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item (s)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(70098693566676482)
,p_plugin_id=>wwv_flow_api.id(70098198323672495)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'jQuery Selector(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E2066696C6C5F6974656D732870526F772C20704974656D732C20704A5129207B0D0A0969662028216C5F726F77292072657475726E3B0D0A090D0A09666F722028696E64657820696E20704974656D7329207B0D0A09092F2AD095D1';
wwv_flow_api.g_varchar2_table(2) := '81D0BBD0B820D183D0BAD0B0D0B7D0B0D0BBD0B820D0B0D182D180D0B8D0B1D183D18220D0BAD0B0D0BA20D0BAD0BED0BDD0B5D187D0BDD18BD0B920D183D0BAD0B0D0B7D0B0D182D0B5D0BBD18C2C20D0B7D0BDD0B0D187D0B8D18220D0B2D18BD0B1D0';
wwv_flow_api.g_varchar2_table(3) := 'B8D180D0B0D0B5D0BC20D0B0D182D0B8D180D0B1D183D18220D18DD0BBD0B5D0BCD0B5D0BDD182D0B020D0BAD0B0D0BA20D0B7D0BDD0B0D187D0B5D0BDD0B8D0B52A2F0D0A0909696620282F5C5B5C772B5C5D242F2E7465737428704A515B696E646578';
wwv_flow_api.g_varchar2_table(4) := '5D2929207B0D0A0909096C5F6174747220203D20704A515B696E6465785D2E6D61746368282F5C5B5C772B5C5D242F295B305D2E736C69636528312C2D31293B0D0A0909096C5F76616C7565203D20242870526F772E717565727953656C6563746F7228';
wwv_flow_api.g_varchar2_table(5) := '704A515B696E6465785D29292E61747472286C5F61747472293B0D0A09097D0D0A09092F2AD0B220D0B8D0BDD0BED0BC20D181D0BBD183D187D0B0D0B520D0BCD18B20D185D0BED182D0B8D0BC20D0B2D0B7D18FD182D18C20D182D0B5D0BAD181D18220';
wwv_flow_api.g_varchar2_table(6) := 'D18DD0BBD0B5D0BCD0B5D0BDD182D0B02A2F0D0A0909656C7365207B0D0A0909096C5F76616C7565203D20242870526F772E717565727953656C6563746F7228704A515B696E6465785D29292E7465787428293B0D0A09097D0D0A09090D0A0909617065';
wwv_flow_api.g_varchar2_table(7) := '782E6974656D28704974656D735B696E6465785D292E73657456616C7565286C5F76616C7565293B0D0A097D0D0A7D3B0D0A0D0A66756E6374696F6E207365745F6972725F726F775F76616C75657328297B0D0A096C5F6974656D73203D20746869732E';
wwv_flow_api.g_varchar2_table(8) := '616374696F6E2E61747472696275746530312E73706C697428272C27293B0D0A096C5F6A51093D20746869732E616374696F6E2E61747472696275746530322E73706C697428272C27293B0D0A090D0A0969662028746869732E74726967676572696E67';
wwv_flow_api.g_varchar2_table(9) := '456C656D656E742E7461674E616D65203D3D2027545227290D0A09096C5F726F77203D20746869732E74726967676572696E67456C656D656E743B0D0A09656C73652069662028746869732E646174612E7461674E616D65203D3D2027545227290D0A09';
wwv_flow_api.g_varchar2_table(10) := '096C5F726F77203D20746869732E646174613B0D0A090D0A0966696C6C5F6974656D73286C5F726F772C206C5F6974656D732C206C5F6A51293B0D0A090D0A092F2AD0A3D181D0BFD0B5D188D0BDD0BED0B520D0B2D18BD0BFD0BED0BBD0BDD0B5D0BDD0';
wwv_flow_api.g_varchar2_table(11) := 'B8D0B52A2F0D0A09617065782E64612E726573756D6528746869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(70101521625773324)
,p_plugin_id=>wwv_flow_api.id(70098198323672495)
,p_file_name=>'app-set-irr-row-values.js'
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
