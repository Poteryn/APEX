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
prompt --application/shared_components/plugins/dynamic_action/custom_submit_disable
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(138203370435922127)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'CUSTOM_SUBMIT_DISABLE'
,p_display_name=>'Submit page with disable elements'
,p_category=>'NAVIGATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_submit (',
'   p_dynamic_action   in apex_plugin.t_dynamic_action',
' , p_plugin           in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result as',
'    l_result   apex_plugin.t_dynamic_action_render_result;',
'begin',
'    apex_javascript.add_library(',
'        p_name        => ''app_submit''',
'      , p_directory   => p_plugin.file_prefix',
'      , p_version     => null',
'      , p_key         => ''submit_js''',
'    );',
'    ',
'    l_result.attribute_01        := p_dynamic_action.attribute_01;',
'    l_result.attribute_02        := p_dynamic_action.attribute_02;',
'    ',
'    l_result.javascript_function := ''plug_submit'';',
'',
'    return l_result;',
'end render_submit;'))
,p_api_version=>2
,p_render_function=>'render_submit'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>10
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(138203509043913659)
,p_plugin_id=>wwv_flow_api.id(138203370435922127)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Request / Button Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(138203882860908910)
,p_plugin_id=>wwv_flow_api.id(138203370435922127)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Show Processing'
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
wwv_flow_api.g_varchar2_table(1) := '76617220475F4C4F434B5F5355424D49543B0D0A0D0A66756E6374696F6E20706C75675F7375626D69742829207B090D0A096966202821475F4C4F434B5F5355424D495429207B09090D0A0909475F4C4F434B5F5355424D4954203D20747275653B0D0A';
wwv_flow_api.g_varchar2_table(2) := '09090D0A09097661722073686F77576169743B0D0A0D0A090969662028746869732E616374696F6E2E6174747269627574653032203D3D20225922290D0A09090973686F7757616974203D20747275653B0D0A0909656C73650D0A09090973686F775761';
wwv_flow_api.g_varchar2_table(3) := '6974203D2066616C73653B0D0A09090D0A09092F2AD094D0B5D0B0D0BAD182D0B8D0B2D0B8D180D0B8D183D0B5D0BC20D0B2D0BED0B7D0BCD0BED0B6D0BDD0BED181D182D18C20D181D0BBD183D187D0B0D0B9D0BDD0BED0B3D0BE20D0BDD0B0D0B6D0B0';
wwv_flow_api.g_varchar2_table(4) := 'D182D0B8D18F2A2F0D0A090969662028746869732E74726967676572696E67456C656D656E742E7461674E616D65203D3D2027494E50555427290D0A090909746869732E74726967676572696E67456C656D656E742E7365744174747269627574652822';
wwv_flow_api.g_varchar2_table(5) := '726561646F6E6C79222C202222290D0A0909656C73652069662028746869732E74726967676572696E67456C656D656E742E7461674E616D65203D3D2027425554544F4E27290D0A090909746869732E74726967676572696E67456C656D656E742E7365';
wwv_flow_api.g_varchar2_table(6) := '74417474726962757465282264697361626C6564222C202222290D0A09090D0A0909617065782E706167652E7375626D6974287B0D0A090909726571756573743A2020746869732E616374696F6E2E61747472696275746530312C0D0A09090973686F77';
wwv_flow_api.g_varchar2_table(7) := '576169743A2073686F77576169742C0D0A09097D293B0D0A202020207D0D0A09656C73650D0A0909636F6E736F6C652E6C6F672822D09FD0BED182D0BED180D0BDD0B0D18F20D0BED0BFD0B5D180D0B0D186D0B8D18F20D0BDD0B520D0B2D18BD0BFD0BE';
wwv_flow_api.g_varchar2_table(8) := 'D0BBD0BDD0B5D0BDD0BDD0B0202D20D0BFD0BED0B4D0BED0B1D0BDD0B0D18F20D0BED0BFD0B5D180D0B0D186D0B8D18F20D183D0B6D0B520D0B2D18BD0BFD0BED0BBD0BDD18FD0B5D182D181D18F2122290D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(138217289888624916)
,p_plugin_id=>wwv_flow_api.id(138203370435922127)
,p_file_name=>'app_submit.js'
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
