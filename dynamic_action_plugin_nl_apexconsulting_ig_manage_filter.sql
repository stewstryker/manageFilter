prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>65488007829801826
,p_default_application_id=>1002
);
end;
/
 
begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/nl_apexconsulting_ig_manage_filter
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(722379129772229900)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'NL.APEXCONSULTING.IG_MANAGE_FILTER'
,p_display_name=>'IG - Manage filter'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#manageFilter.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render',
'( p_dynamic_action in apex_plugin.t_dynamic_action',
', p_plugin         in apex_plugin.t_plugin ',
')',
'return apex_plugin.t_dynamic_action_render_result',
'is',
'  l_result apex_plugin.t_dynamic_action_render_result;',
'begin',
'  if apex_application.g_debug',
'  then',
'    apex_plugin_util.debug_dynamic_action(',
'       p_plugin         => p_plugin,',
'       p_dynamic_action => p_dynamic_action ',
'    );',
'  end if;',
'',
'  l_result.attribute_01        := p_dynamic_action.attribute_01; -- action',
'  l_result.attribute_02        := p_dynamic_action.attribute_02; -- type',
'  l_result.attribute_03        := p_dynamic_action.attribute_03; -- columntype',
'  l_result.attribute_04        := p_dynamic_action.attribute_04; -- columnname',
'  l_result.attribute_05        := p_dynamic_action.attribute_05; -- operator',
'  l_result.attribute_06        := p_dynamic_action.attribute_06; -- value',
'  l_result.attribute_07        := p_dynamic_action.attribute_07; -- save',
'  l_result.attribute_08        := p_dynamic_action.attribute_08; -- isCaseSensitive',
'  l_result.attribute_09        := p_dynamic_action.attribute_09; -- refreshData',
'  l_result.attribute_10        := p_dynamic_action.attribute_10; -- skipNoChangesCheck',
'  l_result.attribute_11        := p_dynamic_action.attribute_11; -- inSeparator',
'',
'  l_result.javascript_function := ''manageFilter.init'';',
'',
'  return l_result;',
'end;'))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'REGION:REQUIRED'
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>'Manages (add / delete) filters in an Interactive Grid. (Update option provided, but not provisioned in the code.)'
,p_version_identifier=>'1.1'
,p_files_version=>23
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722379302971229923)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Action'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'addFilter'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722380246873229939)
,p_plugin_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_display_sequence=>10
,p_display_value=>'Add'
,p_return_value=>'addFilter'
,p_help_text=>'Add a filter'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722380689457229939)
,p_plugin_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_display_sequence=>20
,p_display_value=>'Update'
,p_return_value=>'updateFilter'
,p_help_text=>'Update the filter'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722379665058229929)
,p_plugin_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_display_sequence=>30
,p_display_value=>'Delete'
,p_return_value=>'deleteFilter'
,p_help_text=>'Delete the filter'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722381176446229939)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'column'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722381577921229943)
,p_plugin_attribute_id=>wwv_flow_api.id(722381176446229939)
,p_display_sequence=>10
,p_display_value=>'Column'
,p_return_value=>'column'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722382144199229943)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Columntype'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'column'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722382531849229943)
,p_plugin_attribute_id=>wwv_flow_api.id(722382144199229943)
,p_display_sequence=>10
,p_display_value=>'Column'
,p_return_value=>'column'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722383018514229943)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'IG Column Name'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Name of column in your Interactive Grid to add/update/delete filter.',
'Not actually selectable from the Page Items list.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722383433436229944)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Operator'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'EQ'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
,p_lov_type=>'STATIC'
,p_help_text=>'Select the desired comparison operator'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722383826699229944)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>10
,p_display_value=>'='
,p_return_value=>'EQ'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722391974949254369)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>20
,p_display_value=>'!='
,p_return_value=>'NEQ'
,p_help_text=>'Not Equal to'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722393649580263275)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>30
,p_display_value=>'is null'
,p_return_value=>'N'
,p_help_text=>'Null'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722394035679265023)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>40
,p_display_value=>'is not null'
,p_return_value=>'NN'
,p_help_text=>'Not Null'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722391612664253065)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>50
,p_display_value=>'like'
,p_return_value=>'LIKE'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722393210869261910)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>60
,p_display_value=>'not like'
,p_return_value=>'NLIKE'
,p_help_text=>'Not like - need to provide % around values?'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722390039625241267)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>70
,p_display_value=>'in'
,p_return_value=>'IN'
,p_is_quick_pick=>true
,p_help_text=>'Multiple values must be separated by 01x, which you need to do in a separate page item.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722394421325268486)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>80
,p_display_value=>'not in'
,p_return_value=>'NIN'
,p_help_text=>'Not in - multiple values must be separated by 01x, so probably done in a separate page item.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722391173234250754)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>90
,p_display_value=>'Contains'
,p_return_value=>'C'
,p_is_quick_pick=>true
,p_help_text=>'Contains value'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(493439377606009748)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>100
,p_display_value=>'Not Contains'
,p_return_value=>'NC'
,p_help_text=>'IG Column does not contain the page item value'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722392821605258666)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>110
,p_display_value=>'>'
,p_return_value=>'GT'
,p_help_text=>'Greater than'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722390462311243092)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>120
,p_display_value=>'>='
,p_return_value=>'GTE'
,p_help_text=>'Greater than or Equal to'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722392388403256461)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>130
,p_display_value=>'<'
,p_return_value=>'LT'
,p_help_text=>'Less than'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(722390823846244773)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>140
,p_display_value=>'<='
,p_return_value=>'LTE'
,p_help_text=>'Less than or Equal to'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(247365282490694926)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>150
,p_display_value=>'in the last'
,p_return_value=>'LAST'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'For date comparisons. For example, return records w/ date in the last 6 months.',
'',
'Value passed must be formatted as: #NUM_OF_PERIODS#~#PERIOD_TYPE# (tilde between parts).',
'Period types: Y = Year, M = Month, W = Week, D = Day, H = Hour, MI = Minute.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(247366282371701653)
,p_plugin_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_display_sequence=>160
,p_display_value=>'not in the last'
,p_return_value=>'NLAST'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'For date comparisons. For example, return records w/ date NOT in the last 2 years.',
'Value passed must be formatted as: #NUM_OF_PERIODS#~#PERIOD_TYPE# (tilde between parts).',
'Period types: Y = Year, M = Month, W = Week, D = Day, H = Hour, MI = Minute'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722384312540229944)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
,p_help_text=>'Page item holding the filter value'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722384759821229944)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Save'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722385104122229945)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Case sensitive'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722385482882229945)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Refresh data'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(722385875809229945)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Skip "No-changes-check"'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722379302971229923)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'deleteFilter'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(246815176029448041)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'IN Separator'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>':'
,p_max_length=>5
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(722383433436229944)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'IN,NIN'
,p_help_text=>'Provide character(s) that separate your page item''s values, (e.g. 1992,1993,2000). They will be converted to the value Apex expects (01x).'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '766172206D616E61676546696C746572203D207B0D0A2020696E6974203A2066756E6374696F6E28297B0D0A20202020766172206461203D20746869733B0D0A202020207661722076416374696F6E202020202020202020202020203D2064612E616374';
wwv_flow_api.g_varchar2_table(2) := '696F6E2E61747472696275746530313B0D0A202020207661722076547970652020202020202020202020202020203D2064612E616374696F6E2E61747472696275746530323B20200D0A202020207661722076436F6C756D6E5479706520202020202020';
wwv_flow_api.g_varchar2_table(3) := '20203D2064612E616374696F6E2E61747472696275746530333B20200D0A202020207661722076436F6C756D6E4E616D652020202020202020203D2064612E616374696F6E2E61747472696275746530343B20200D0A2020202076617220764F70657261';
wwv_flow_api.g_varchar2_table(4) := '746F7220202020202020202020203D2064612E616374696F6E2E61747472696275746530353B20200D0A20202020766172207656616C756520202020202020202020202020203D20617065782E6974656D282064612E616374696F6E2E61747472696275';
wwv_flow_api.g_varchar2_table(5) := '7465303620292E67657456616C756528293B20200D0A202020207661722076536176652020202020202020202020202020203D20282064612E616374696F6E2E6174747269627574653037203D3D2022592220293B20200D0A2020202076617220764361';
wwv_flow_api.g_varchar2_table(6) := '736553656E7369746976652020202020203D20282064612E616374696F6E2E6174747269627574653038203D3D2022592220293B20200D0A202020207661722076526566726573684461746120202020202020203D20282064612E616374696F6E2E6174';
wwv_flow_api.g_varchar2_table(7) := '747269627574653039203D3D2022592220293B20200D0A202020207661722076536B69704E6F4368616E676573436865636B203D20282064612E616374696F6E2E6174747269627574653130203D3D2022592220293B20200D0A20202020766172207649';
wwv_flow_api.g_varchar2_table(8) := '6E536570617261746F7220202020202020203D2064612E616374696F6E2E61747472696275746531313B20200D0A0D0A202020207661722076526567696F6E203D20617065782E726567696F6E282064612E6166666563746564456C656D656E74735B30';
wwv_flow_api.g_varchar2_table(9) := '5D2E696420293B0D0A202020200D0A202020202F2F204966206F70657261746F7220697320494E206F72204E4F5420494E2C207265706C61636520776974682070726F76696465642076616C75650D0A20202020696620282876496E536570617261746F';
wwv_flow_api.g_varchar2_table(10) := '72292026262028764F70657261746F72203D3D2022494E22207C7C20764F70657261746F72203D3D20224E494E222929207B0D0A2020202020207656616C7565203D207656616C75652E7265706C616365282F3A2F672C20537472696E672E66726F6D43';
wwv_flow_api.g_varchar2_table(11) := '686172436F646528303129293B0D0A202020207D0D0A202020200D0A202020202F2F2052656D6F76652063757272656E742066696C746572730D0A20202020766172207646696C74657273203D2076526567696F6E2E63616C6C28202267657446696C74';
wwv_flow_api.g_varchar2_table(12) := '6572732220293B0D0A20202020766172207646696C746572436F6C4964203D2076526567696F6E2E63616C6C2822676574566965777322292E677269642E6D6F64656C436F6C756D6E735B202076436F6C756D6E4E616D6520205D2E69643B0D0A202020';
wwv_flow_api.g_varchar2_table(13) := '20666F72202820766172206920696E207646696C7465727320297B0D0A202020202069662028207646696C746572735B695D2E636F6C756D6E4964203D3D207646696C746572436F6C496420297B0D0A2020202020202076526567696F6E2E63616C6C28';
wwv_flow_api.g_varchar2_table(14) := '202264656C65746546696C746572222C207646696C746572735B695D2E696420293B0D0A20202020207D20200D0A202020207D0D0A0D0A20202020696620282076416374696F6E203D3D202261646446696C74657222297B0D0A20202020202020207652';
wwv_flow_api.g_varchar2_table(15) := '6567696F6E2E63616C6C282076416374696F6E0D0A202020202020202020202C207B20747970652020202020202020202020202020203A2076547970650D0A2020202020202020202020202C20636F6C756D6E547970652020202020202020203A207643';
wwv_flow_api.g_varchar2_table(16) := '6F6C756D6E547970650D0A2020202020202020202020202C20636F6C756D6E4E616D652020202020202020203A2076436F6C756D6E4E616D650D0A2020202020202020202020202C206F70657261746F7220202020202020202020203A20764F70657261';
wwv_flow_api.g_varchar2_table(17) := '746F720D0A2020202020202020202020202C2076616C756520202020202020202020202020203A207656616C75650D0A2020202020202020202020202C20736176652020202020202020202020202020203A2076536176650D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(18) := '20202C2069734361736553656E736974697665202020203A20764361736553656E7369746976650D0A2020202020202020202020202C20726566726573684461746120202020202020203A207652656672657368446174610D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(19) := '20202C20736B69704E6F4368616E676573436865636B203A2076536B69704E6F4368616E676573436865636B200D0A202020202020202020207D293B0D0A202020207D2020202020200D0A20207D202020200D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(722389495515229984)
,p_plugin_id=>wwv_flow_api.id(722379129772229900)
,p_file_name=>'manageFilter.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
