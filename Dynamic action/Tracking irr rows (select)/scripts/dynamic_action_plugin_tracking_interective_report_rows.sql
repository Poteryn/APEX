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
prompt --application/shared_components/plugins/dynamic_action/отследить_выбор_строк_interective_report
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(69796511021954762)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>unistr('\041E\0422\0421\041B\0415\0414\0418\0422\042C \0412\042B\0411\041E\0420 \0421\0422\0420\041E\041A INTERECTIVE REPORT')
,p_display_name=>unistr('\041E\0442\0441\043B\0435\0434\0438\0442\044C \0432\044B\0431\043E\0440 \0441\0442\0440\043E\043A [Interective Report]')
,p_category=>'MISC'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_tracking_irr_rows (',
'   p_dynamic_action   in apex_plugin.t_dynamic_action',
' , p_plugin           in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result as',
'  l_result   apex_plugin.t_dynamic_action_render_result;',
'begin',
'  apex_javascript.add_library(',
'      p_name        => ''app-tracking-irr-rows''',
'    , p_directory   => p_plugin.file_prefix',
'    , p_version     => null',
'    , p_key         => ''select_irr_row_js''',
'  );',
'',
'  apex_css.add_file(',
'      p_name        => ''style-tracking-irr-rows''',
'    , p_directory   => p_plugin.file_prefix',
'    , p_version     => null',
'    , p_key         => ''select_irr_row_css''',
'  );',
'  ',
'  l_result.attribute_01        := p_dynamic_action.attribute_01;',
'  l_result.attribute_02        := p_dynamic_action.attribute_02;',
'  l_result.javascript_function := ''add_event_tracking_rows'';',
'',
'  return l_result;',
'end render_tracking_irr_rows;'))
,p_api_version=>2
,p_render_function=>'render_tracking_irr_rows'
,p_standard_attributes=>'REGION:REQUIRED:STOP_EXECUTION_ON_ERROR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>unistr('\041F\043E\0441\043B\0435 \0432\044B\0431\043E\0440\0430 \0441\0442\0440\043E\043A\0438, \0434\043E\043F\043E\043B\043D\0438\0442\0435\043B\044C\043D\043E \0438\043D\0438\0446\0438\0430\043B\0438\0437\0438\0440\0443\0435\0442\0441\044F custom \0441\043E\0431\044B\0442\0438\0435 "CST_IR_ROW_SELECTED".')
,p_version_identifier=>'1.0'
,p_files_version=>26
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2AD0B2D18BD0B1D180D0B0D0BDD0BDD0B0D18F20D181D182D180D0BED0BAD0B020D0BED182D187D0B5D182D0B02A2F0D0A2E6972725F726F775F73656C65637465642074647B0D0A202020206261636B67726F756E642D636F6C6F723A202337366238';
wwv_flow_api.g_varchar2_table(2) := '6531363621696D706F7274616E743B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(69866793610575929)
,p_plugin_id=>wwv_flow_api.id(69796511021954762)
,p_file_name=>'style-tracking-irr-rows.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E2073656C6563745F6972725F726F7728705F63757272656E745F726F7729207B0D0A202020202428705F63757272656E745F726F77292E706172656E74282774626F647927292E6368696C6472656E28272E6972725F726F775F7365';
wwv_flow_api.g_varchar2_table(2) := '6C656374656427292E72656D6F7665436C61737328226972725F726F775F73656C656374656422293B0D0A202020202428705F63757272656E745F726F77292E616464436C61737328226972725F726F775F73656C656374656422293B0D0A7D3B0D0A0D';
wwv_flow_api.g_varchar2_table(3) := '0A66756E6374696F6E206164645F6576656E745F747261636B696E675F726F777328297B0D0A092F2AD0A0D0B5D0B3D0B8D0BED0BD20D0BCD0BED0B6D0B5D18220D0B1D18BD182D18C20D182D0BED0BBD18CD0BAD0BE20D0BED0B4D0B8D0BD2C20D0BFD0';
wwv_flow_api.g_varchar2_table(4) := 'BED18DD182D0BED0BCD18320D0B1D0B5D180D0B5D0BC20302DD0BED0B920D18DD0BBD0B5D0BCD0B5D0BDD1822A2F0D0A202020206C5F726567696F6E203D20746869732E6166666563746564456C656D656E74735B305D3B0D0A0D0A202020202F2AD181';
wwv_flow_api.g_varchar2_table(5) := 'D182D0B0D0BDD0B4D0B0D180D182D0BDD18BD0B920D0BFD183D182D18C20D0B4D0BE20D181D182D180D0BED0BA2049522A2F0D0A202020206C5F726F77735F726567696F6E203D202428272327202B206C5F726567696F6E2E6964202B20275F64617461';
wwv_flow_api.g_varchar2_table(6) := '5F70616E656C202E742D6668742D74626F6479207461626C652E612D4952522D7461626C6520747227293B0D0A092F2AD094D0BBD18F20D181D182D180D0BED0BA20D0B4D0BED0B1D0B0D0B2D0BBD18FD0B5D0BC20D0B0D182D180D0B8D0B1D183D18220';
wwv_flow_api.g_varchar2_table(7) := '22696420D180D0B5D0B3D0B8D0BED0BDD0B0222C20D187D182D0BED0B1D18B20D0BDD0B520D0B8D181D0BAD0B0D182D18C20D0B5D0B3D0BE20D0B220D180D0BED0B4D0B8D182D0B5D0BBD18CD181D0BAD0B8D18520D18DD0BBD0B5D0BCD0B5D0BDD182D0';
wwv_flow_api.g_varchar2_table(8) := 'B0D1850D0A092020D09DD183D0B6D0BDD0BE20D0B4D0BBD18F20D0BED0B1D180D0B0D182D0BDD0BED0B3D0BE20D0B2D18BD0B7D0BED0B2D0B020D0B220D0BAD0B0D181D182D0BED0BCD0BDD0BED0BC20D181D0BED0B1D18BD182D0B8D0B8202249525F52';
wwv_flow_api.g_varchar2_table(9) := '4F575F53454C4543544544220D0A092A2F0D0A096C5F726F77735F726567696F6E2E6174747228274952525F726567696F6E5F6964272C206C5F726567696F6E2E6964293B0D0A090D0A092F2AD094D0BED0B1D0B2D0BBD18FD0B5D0BC20D0BED0B1D180';
wwv_flow_api.g_varchar2_table(10) := 'D0B0D0B1D0BED182D187D0B8D0BA20D0BDD0B0D0B6D0B0D182D0B8D18F20D0BDD0B020D181D182D180D0BED0BAD1832049522A2F0D0A202020206C5F726F77735F726567696F6E2E636C69636B2866756E6374696F6E2829207B0D0A09096C5F72656769';
wwv_flow_api.g_varchar2_table(11) := '6F6E5F6964203D20242874686973292E6174747228274952525F726567696F6E5F696427293B0D0A09090D0A202020202020202073656C6563745F6972725F726F772874686973293B0D0A09090D0A09092F2AD098D0BDD0B8D186D0B8D0B8D180D183D0';
wwv_flow_api.g_varchar2_table(12) := 'B5D0BC20D181D0BED0B1D18BD182D0B8D0B520D0B2D18BD0B1D0BED180D0B020D181D182D180D0BED0BAD0B820D180D0B5D0B3D0B8D0BED0BDD0B02C20D183D0BAD0B0D0B7D0B0D0B220D181D181D18BD0BBD0BAD18320D0BDD0B020D0B2D18BD0B1D180';
wwv_flow_api.g_varchar2_table(13) := 'D0B0D0BDD0BDD183D18E20D181D182D180D0BED0BAD1832A2F0D0A0909617065782E6576656E742E7472696767657228272327202B206C5F726567696F6E5F69640D0A090920202020202020202020202020202020202C20274353545F49525F524F575F';
wwv_flow_api.g_varchar2_table(14) := '53454C4543544544270D0A090909090909202C20746869730D0A0920202020293B0D0A202020207D293B0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(75573418867472702)
,p_plugin_id=>wwv_flow_api.id(69796511021954762)
,p_file_name=>'app-tracking-irr-rows.js'
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
