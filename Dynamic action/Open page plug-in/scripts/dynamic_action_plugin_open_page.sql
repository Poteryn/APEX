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
prompt --application/shared_components/plugins/dynamic_action/open_page
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(72795637831789035)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'OPEN PAGE'
,p_display_name=>unistr('\041E\0442\043A\0440\044B\0442\044C \0441\0442\0440\0430\043D\0438\0446\0443')
,p_category=>'NAVIGATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>'#APP_IMAGES#js/global-custom-js.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_open_page (',
'   p_dynamic_action   in apex_plugin.t_dynamic_action',
' , p_plugin           in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result as',
'  l_result   apex_plugin.t_dynamic_action_render_result;',
'begin',
'  apex_javascript.add_library(',
'      p_name        => ''app_open_page''',
'    , p_directory   => p_plugin.file_prefix',
'    , p_version     => null',
'    , p_key         => ''open_page_js''',
'  );',
'  ',
'  l_result.attribute_01        := p_dynamic_action.attribute_01;',
'  l_result.attribute_02        := p_dynamic_action.attribute_02;',
'  l_result.attribute_03        := p_dynamic_action.attribute_03;',
'  l_result.attribute_04        := p_dynamic_action.attribute_04;',
'  l_result.attribute_05        := p_dynamic_action.attribute_05;',
'  l_result.attribute_06        := p_dynamic_action.attribute_06;',
'  l_result.attribute_07        := p_dynamic_action.attribute_07;',
'  l_result.javascript_function := ''plug_open_page'';',
'',
'  return l_result;',
'end render_open_page;'))
,p_api_version=>2
,p_render_function=>'render_open_page'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>9
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(72802801765539357)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Application'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'110'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(72803501515537319)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Page'
,p_attribute_type=>'PAGE NUMBER'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(72804227962534959)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Clear Cache'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(72804969105532512)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Item (s)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(72805659335527098)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Value (s)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(72806364475525534)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Request'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(72807068435523744)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Triggering Element'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20706C75675F6F70656E5F706167652829207B200D0A202020206C5F74726967676572696E67456C656D203D20746869732E616374696F6E2E61747472696275746530373B0D0A090D0A0964617461536574203D207B0D0A09202020';
wwv_flow_api.g_varchar2_table(2) := '207830313A20746869732E616374696F6E2E61747472696275746530312C0D0A09097830323A20746869732E616374696F6E2E61747472696275746530322C0D0A09097830333A20746869732E616374696F6E2E61747472696275746530332C0D0A0909';
wwv_flow_api.g_varchar2_table(3) := '7830343A20746869732E616374696F6E2E61747472696275746530342C0D0A09097830353A20746869732E616374696F6E2E61747472696275746530352C0D0A09097830363A20746869732E616374696F6E2E61747472696275746530360D0A097D0D0A';
wwv_flow_api.g_varchar2_table(4) := '202020200D0A096F70656E5F7061676528646174615365742C206C5F74726967676572696E67456C656D293B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(73133472806985061)
,p_plugin_id=>wwv_flow_api.id(72795637831789035)
,p_file_name=>'app_open_page.js'
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
