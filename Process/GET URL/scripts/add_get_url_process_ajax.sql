begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(70623256790146141)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_URL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_url varchar2(2000);',
'begin',
'    l_url := apex_page.GET_URL (',
'        p_application => apex_application.g_x01,',
'        p_page        => apex_application.g_x02,',
'        p_clear_cache => apex_application.g_x03,',
'        p_items       => apex_application.g_x04,',
'        p_values      => apex_application.g_x05,',
'        p_request     => apex_application.g_x06',
'    );',
'',
'    apex_json.open_object; ',
'    apex_json.write(''url'', l_url); ',
'    apex_json.close_all; ',
'end;'))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
end;