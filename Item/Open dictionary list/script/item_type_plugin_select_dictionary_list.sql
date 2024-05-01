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
prompt --application/shared_components/plugins/item_type/select_dictionary_list_kiz
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(73094082465274763)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'SELECT DICTIONARY LIST (KIZ)'
,p_display_name=>unistr('\0412\044B\0431\043E\0440 \0438\0437 \0441\043F\0440\0430\0432\043E\0447\043D\0438\043A\0430 (\041A\0438\0417)')
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_javascript_file_urls=>'#APP_IMAGES#js/global-custom-js.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render_dict_list_item(',
'    p_item                in apex_plugin.t_page_item',
'  , p_plugin              in apex_plugin.t_plugin',
'  , p_param               in apex_plugin.t_item_render_param',
'  , p_result              in out nocopy apex_plugin.t_item_render_result',
')',
'IS',
'    l_name_item   varchar2(200);',
'    l_value       number;',
'    l_name_value  varchar2(2000);',
'    v_onload_code varchar2(2000);',
'BEGIN',
'    l_name_item  := apex_plugin.get_input_name_for_page_item(',
'                        p_is_multi_value => false',
'                    );',
'    ',
'    if p_param.value is not null then',
'        l_value      := to_number(p_param.value);',
'        l_name_value := kiz_api_pkg.get_dict_val_name(',
'                            p_dict_val_id => l_value',
'                          , p_table_name  => p_item.attribute_01',
'                        );',
'        l_name_value := sys.htf.escape_sc(l_name_value);',
'    end if;',
'    ',
'    if p_param.is_readonly then',
'        sys.htp.prn(''<input type="hidden" name="''||l_name_item||''" id="''||l_name_item||''" value="''||l_value||''">'');',
'        sys.htp.prn(''<span id="''||l_name_item||''_DISPLAY" class="display_only apex-item-display-only plugin-item-dict-list--display_only ''||p_item.element_css_classes||''">''||l_name_value||''</span>'');',
'    else',
'        sys.htp.prn(''<input type="hidden" name="''||l_name_item||''" id="''||l_name_item||''_HIDDENVALUE" value="''||l_value||''">'');',
'        sys.htp.prn(''<input readonly ''',
'                         ||''onclick = "open_dict_list(this)" ''',
'                         ||''table_name="''||p_item.attribute_01||''" ''',
'                         ||''class="apex-item-text apex-item-popup-lov plugin-item-dict-list ''||p_item.element_css_classes||''" ''',
'                         ||''id    = "''||l_name_item||''" ''',
'                         ||''type  = "text" ''',
'                         ||p_item.element_attributes||'' ''',
'                         ||''value="''||l_name_value||''" ''',
'                    ||''/>''',
'        );',
'    end if;',
'',
'    apex_css.add_file(',
'        p_name        => ''style-dict-list-item''',
'      , p_directory   => p_plugin.file_prefix',
'      , p_version     => null',
'      , p_key         => ''dict_list_item_css''',
'    );',
'',
'    apex_javascript.add_library(',
'        p_name        => ''app-dict-list-item''',
'      , p_directory   => p_plugin.file_prefix',
'      , p_version     => null',
'      , p_key         => ''dict_list_item_js''',
'    );',
'  ',
'    v_onload_code := ''apex.jQuery("#''||l_name_item||''").on("apexafterclosedialog", set_selected_dict_val)'';',
'    apex_javascript.add_onload_code (p_code => v_onload_code);',
'END;'))
,p_api_version=>2
,p_render_function=>'render_dict_list_item'
,p_standard_attributes=>'VISIBLE:READONLY:SOURCE:ELEMENT_OPTION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>4
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(73094861703265468)
,p_plugin_id=>wwv_flow_api.id(73094082465274763)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Report'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E706C7567696E2D6974656D2D646963742D6C6973747B0D0A09637572736F723A20706F696E7465723B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(73145346848904243)
,p_plugin_id=>wwv_flow_api.id(73094082465274763)
,p_file_name=>'style-dict-list-item.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E206F70656E5F646963745F6C697374287054686973297B0D0A096461746153656E74203D207B0D0A09097830313A203131302C0D0A09202020207830323A203330392C0D0A09097830333A203330392C0D0A09097830343A20275033';
wwv_flow_api.g_varchar2_table(2) := '30395F5441424C455F4E414D45272C0D0A09097830353A2024287054686973292E6174747228277461626C655F6E616D6527290D0A097D3B0D0A090D0A096F70656E5F70616765286461746153656E742C20272327202B2070546869732E6964293B0D0A';
wwv_flow_api.g_varchar2_table(3) := '7D0D0A0D0A66756E6374696F6E207365745F73656C65637465645F646963745F76616C28652C2064617461297B0D0A096C5F6974656D203D20652E7461726765742E69643B0D0A09617065782E6974656D286C5F6974656D292E73657456616C75652864';
wwv_flow_api.g_varchar2_table(4) := '6174612E503330395F49442C20646174612E503330395F56414C5545293B0D0A090D0A092F2AD098D0BDD0B8D186D0B8D0B8D180D183D0B5D0BC20D181D0BED0B1D18BD182D0B8D0B520D183D181D182D0B0D0BDD0BED0B2D0BAD0B820D0B7D0BDD0B0D1';
wwv_flow_api.g_varchar2_table(5) := '87D0B5D0BDD0B8D18F2A2F0D0A09617065782E6576656E742E7472696767657228272327202B206C5F6974656D0D0A0909090909202C20274353545F5345545F444943545F56414C5545270D0A09293B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(73149553362854670)
,p_plugin_id=>wwv_flow_api.id(73094082465274763)
,p_file_name=>'app-dict-list-item.js'
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
