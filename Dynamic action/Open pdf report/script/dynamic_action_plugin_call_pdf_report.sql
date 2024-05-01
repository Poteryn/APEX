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
prompt --application/shared_components/plugins/dynamic_action/call_pdf_report
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(78043038265662912)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'CALL_PDF_REPORT'
,p_display_name=>unistr('\0421\0444\043E\0440\043C\0438\0440\043E\0432\0430\0442\044C PDF \043E\0442\0447\0435\0442')
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function make_pdf (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_ajax_result',
'as',
'    l_base64      clob;',
'    l_result      apex_plugin.t_dynamic_action_ajax_result;',
'begin',
'    l_base64 := pack_webservice.get_report_base64(',
'                      p_report_id => p_dynamic_action.attribute_01',
'                    , p_param     => apex_application.g_x01',
'                  );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''pdf_base64'', l_base64);',
'    apex_json.close_all;',
'    ',
'    return l_result;',
'end;',
'',
'function render_pdf_report (',
'   p_dynamic_action   in apex_plugin.t_dynamic_action',
' , p_plugin           in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result as',
'    l_result   apex_plugin.t_dynamic_action_render_result;',
'begin',
'    apex_javascript.add_library(',
'        p_name        => ''app_pdf_report''',
'      , p_directory   => p_plugin.file_prefix',
'      , p_version     => null',
'      , p_key         => ''pdf_report_js''',
'    );',
'  ',
'    l_result.attribute_02        := p_dynamic_action.attribute_02;',
'    ',
'    l_result.ajax_identifier     := apex_plugin.get_ajax_identifier;',
'    l_result.javascript_function := ''plug_pdf_report'';',
'',
'    return l_result;',
'end render_pdf_report;'))
,p_api_version=>2
,p_render_function=>'render_pdf_report'
,p_ajax_function=>'make_pdf'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>15
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(78044999074632677)
,p_plugin_id=>wwv_flow_api.id(78043038265662912)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Report ID'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(78045208088631960)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>10
,p_display_value=>unistr('\0423\043F\0430\043A\043E\0432\043A\0430 \043A\043E\0440\043E\0431\0430')
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(78176460800390221)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>20
,p_display_value=>unistr('\0423\043F\0430\043A\043E\0432\043E\0447\043D\044B\0439 \043B\0438\0441\0442')
,p_return_value=>'7'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(78516818549262923)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>30
,p_display_value=>'19'
,p_return_value=>unistr('\0422\043E\0440\0433 13')
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(78528775012254972)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>40
,p_display_value=>unistr('\0422\043E\0440\0433 13')
,p_return_value=>'19'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(78605467882677815)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>50
,p_display_value=>unistr('\0422\043E\0440\0433 12')
,p_return_value=>'18'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(79287081713830029)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>60
,p_display_value=>unistr('\041E\0448\0438\0431\043A\0438 \0437\0430\044F\0432\043A\0438 (err30)')
,p_return_value=>'23'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(79816050278138478)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>70
,p_display_value=>unistr('\041E\0441\0442\0430\0442\043E\043A \041A\0438\0417 \043F\043E \043A\043E\043D\0442\0440\0430\0433\0435\043D\0442\0430\043C')
,p_return_value=>'8'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(79976196632140768)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>80
,p_display_value=>unistr('\0410\043A\0442 \043E\0431 \0443\043D\0438\0447\0442\043E\0436\0435\043D\0438\0438 \0431\043B\0430\043D\043A\043E\0432 \0441\0442\0440\043E\0433\043E\0439 \043E\0442\0447\0435\0442\043D\043E\0441\0442\0438')
,p_return_value=>'4'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(80246892370477438)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>90
,p_display_value=>unistr('\0417\0430\0434\0430\043D\0438\0435 \043D\0430 \043C\0430\0440\043A\0438\0440\043E\0432\043A\0443 \0442\043E\0432\0430\0440\0430 \041A\0438\0417, \043D\0430 \0441\043A\043B\0430\0434\0435')
,p_return_value=>'9'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(80596852693418102)
,p_plugin_attribute_id=>wwv_flow_api.id(78044999074632677)
,p_display_sequence=>100
,p_display_value=>unistr('\0411\0435\0439\0434\0436\0438\043A \0441\043E\0442\0440\0443\0434\043D\0438\043A\0430')
,p_return_value=>'22'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(78295566022428945)
,p_plugin_id=>wwv_flow_api.id(78043038265662912)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Report param(s)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E206D616B655F66696E697368287054726967456C656D2C2070526573756D6543616C6C6261636B297B0D0A20202020696620287054726967456C656D2E7461674E616D65203D3D2027425554544F4E27290D0A09097054726967456C';
wwv_flow_api.g_varchar2_table(2) := '656D2E64697361626C6564203D2066616C73653B0D0A090D0A092F2AD0A1D0BED0BED0B1D189D0B0D0B5D0BC20D0BE20D0B2D18BD0BFD0BED0BBD0BDD0B5D0BDD0B8D0B820D0BFD180D0BED186D0B5D181D181D0B02A2F0D0A09617065782E64612E7265';
wwv_flow_api.g_varchar2_table(3) := '73756D652870526573756D6543616C6C6261636B2C2066616C7365293B0D0A7D3B0D0A0D0A66756E6374696F6E20706C75675F7064665F7265706F72742829207B09090D0A0976416A61784964656E746966696572203D20746869732E616374696F6E2E';
wwv_flow_api.g_varchar2_table(4) := '616A61784964656E7469666965723B0D0A0976526573756D6543616C6C6261636B203D20746869732E726573756D6543616C6C6261636B3B0D0A09764461746153657420202020202020203D207B7D3B0D0A097654726967456C656D09202020203D2074';
wwv_flow_api.g_varchar2_table(5) := '6869732E74726967676572696E67456C656D656E743B0D0A090D0A09696620287654726967456C656D2E7461674E616D65203D3D2027425554544F4E27290D0A20202020202020207654726967456C656D2E64697361626C6564203D20747275653B0D0A';
wwv_flow_api.g_varchar2_table(6) := '090D0A0969662028746869732E616374696F6E2E617474726962757465303229207B0D0A0909764172724974656D73202020203D20746869732E616374696F6E2E61747472696275746530322E73706C697428272C27293B202F2F4954454D2873292070';
wwv_flow_api.g_varchar2_table(7) := '6172616D2076616C75650D0A0909765265706F7274506172616D203D2027273B0D0A09090D0A0920202020666F7228696E64657820696E20764172724974656D73297B0D0A202020202020202020202020765265706F7274506172616D203D2076526570';
wwv_flow_api.g_varchar2_table(8) := '6F7274506172616D202B20223B22202B20617065782E6974656D28764172724974656D735B696E6465785D292E67657456616C756528293B0D0A20202020202020207D0D0A09090D0A090969662028765265706F7274506172616D29207B0D0A09202020';
wwv_flow_api.g_varchar2_table(9) := '2020202020765265706F7274506172616D203D20765265706F7274506172616D2E7265706C616365282F5E3B2F2C2727293B0D0A09092020202076446174615365742E783031203D20765265706F7274506172616D3B0D0A09202020207D0D0A097D0D0A';
wwv_flow_api.g_varchar2_table(10) := '090D0A09617065782E7365727665722E706C7567696E280D0A090976416A61784964656E7469666965722C0D0A090976446174615365742C200D0A09097B200D0A090909737563636573733A2066756E6374696F6E28704461746129207B200D0A090909';
wwv_flow_api.g_varchar2_table(11) := '096C65742070646657696E646F77203D2077696E646F772E6F70656E282222293B0D0A090909090D0A2020202020202020202020202020202070646657696E646F772E646F63756D656E742E7772697465280D0A0909090920202020223C68746D6C3E3C';
wwv_flow_api.g_varchar2_table(12) := '686561643E3C7469746C653E5072696E744C6162656C3C2F7469746C653E3C2F686561643E3C626F6479207374796C653D276D617267696E3A30273E220D0A09090909202020202B20223C696672616D652077696474683D273130302527206865696768';
wwv_flow_api.g_varchar2_table(13) := '743D273130302527207374796C653D27626F726465722D77696474683A3027207372633D27646174613A6170706C69636174696F6E2F7064663B6261736536342C2022202B20656E636F64655552492870446174612E7064665F62617365363429202B20';
wwv_flow_api.g_varchar2_table(14) := '22273E3C2F696672616D653E220D0A09090909202020202B20223C2F626F64793E3C2F68746D6C3E220D0A20202020202020202020202020202020293B0D0A090909090D0A090909096D616B655F66696E697368287654726967456C656D2C2076526573';
wwv_flow_api.g_varchar2_table(15) := '756D6543616C6C6261636B293B0D0A0909097D2C0D0A2020202020202020202020206572726F723A2066756E6374696F6E28612C622C63297B0D0A09090909636F6E736F6C652E6C6F6728276572726F72205072696E744C6162656C27293B0D0A090909';
wwv_flow_api.g_varchar2_table(16) := '09636F6E736F6C652E6C6F6728612C622C63293B0D0A090909090D0A09090909617065782E6D6573736167652E616C6572742822D09FD180D0B820D184D0BED180D0BCD0B8D180D0BED0B2D0B0D0BDD0B8D0B820D0B4D0BED0BAD183D0BCD0B5D0BDD182';
wwv_flow_api.g_varchar2_table(17) := 'D0B020D0BFD180D0BED0B8D0B7D0BED188D0BBD0B020D0BED188D0B8D0B1D0BAD0B02E20D09FD0BED0BFD180D0BED0B1D183D0B9D182D0B520D181D0BDD0BED0B2D0B020D0BFD0BED0B7D0B4D0BDD0B5D0B52E22293B0D0A090909090D0A090909096D61';
wwv_flow_api.g_varchar2_table(18) := '6B655F66696E697368287654726967456C656D2C2076526573756D6543616C6C6261636B293B0D0A0909097D0D0A09097D0D0A09293B0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(99343370113763937)
,p_plugin_id=>wwv_flow_api.id(78043038265662912)
,p_file_name=>'app_pdf_report.js'
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
