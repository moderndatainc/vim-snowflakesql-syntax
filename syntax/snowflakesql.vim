" Vim syntax file
" Language:	SQL, SnowflakeSQL
" Maintainer:	Daniel Arndt
" Repository:
" License:	Vim

if exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword sqlSpecial	false null true

syn keyword sqlKeyword	access add as asc begin by case check cluster column
syn keyword sqlKeyword	cache compress connect current cursor decimal default desc
syn keyword sqlKeyword	else elsif end exception exclusive file for from
syn keyword sqlKeyword	function group having identified if immediate increment
syn keyword sqlKeyword	index initial initrans into is level link logging loop
syn keyword sqlKeyword	maxextents maxtrans mode modify monitoring
syn keyword sqlKeyword	nocache nocompress nologging noparallel nowait of offline on online start
syn keyword sqlKeyword	parallel successful synonym table tablespace then to trigger uid
syn keyword sqlKeyword	unique user validate values view when whenever
syn keyword sqlKeyword	where with option order pctfree pctused privileges procedure
syn keyword sqlKeyword	public resource return row rowlabel rownum rows
syn keyword sqlKeyword	session share size smallint type using
syn keyword sqlKeyword	join cross inner outer left right

syn keyword sqlStatement analyze audit comment commit
syn keyword sqlStatement delete drop execute explain grant lock noaudit
syn keyword sqlStatement rename revoke rollback savepoint set
syn keyword sqlStatement truncate
" next ones are contained, so folding works.
syn keyword sqlStatement create update alter select insert contained

" Strings:
syn region sqlString	matchgroup=Quote start=+n\?"+     end=+"+
syn region sqlString	matchgroup=Quote start=+n\?'+     end=+'+
syn region sqlString	matchgroup=Quote start=+n\?q'\z([^[(<{]\)+    end=+\z1'+
syn region sqlString	matchgroup=Quote start=+n\?q'<+   end=+>'+
syn region sqlString	matchgroup=Quote start=+n\?q'{+   end=+}'+
syn region sqlString	matchgroup=Quote start=+n\?q'(+   end=+)'+
syn region sqlString	matchgroup=Quote start=+n\?q'\[+  end=+]'+

" Numbers:
syn match sqlNumber	"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment	start="/\*"  end="\*/" contains=sqlTodo,@Spell fold 
syn match sqlComment	"--.*$" contains=sqlTodo,@Spell
syn match sqlComment	"^rem.*$" contains=sqlTodo,@Spell

" Setup Folding:
" this is a hack, to get certain statements folded.
" the keywords create/update/alter/select/insert need to
" have contained option.
syn region sqlFold start='^\s*\zs\c\(Create\|Update\|Alter\|Select\|Insert\)' end=';$\|^$' transparent fold contains=ALL

syn sync ccomment sqlComment

" Todo:
syn keyword sqlTodo TODO FIXME XXX DEBUG NOTE contained


" Above: Standard SQL syntax that may need to be removed as it is discovered to
" conflict or not be valid
" Below:
" Verified (new, vetted) highlighting in the SnowflakeSQL syntax:

" Functions:
" FIXME: Can't add `contains`, vim won't parse correctly
syn keyword sqlFunction	abs acos acosh add_months all_user_names any_value approx_count_distinct
syn keyword sqlFunction	approx_percentile approx_percentile_accumulate approx_percentile_combine
syn keyword sqlFunction	approx_percentile_estimate approx_top_k approx_top_k_accumulate
syn keyword sqlFunction	approx_top_k_combine approx_top_k_estimate approximate_jaccard_index
syn keyword sqlFunction	approximate_similarity array_agg array_append array_cat array_compact
syn keyword sqlFunction	array_construct array_construct_compact array_contains array_insert
syn keyword sqlFunction	array_intersection array_position array_prepend array_size array_slice
syn keyword sqlFunction	array_to_string arrays_overlap as_array as_binary
syn keyword sqlFunction	as_boolean as_date as_integer as_object as_time as_timestamp_ltz
syn keyword sqlFunction	as_timestamp_ntz as_timestamp_tz ascii asin asinh atan atan2 atanh
syn keyword sqlFunction	auto_refresh_registration_history automatic_clustering_history avg
syn keyword sqlFunction	base64_decode_binary base64_decode_string base64_encode between
syn keyword sqlFunction	bit_length bitand bitand_agg bitmap_bit_position bitmap_bucket_number
syn keyword sqlFunction	bitmap_construct_agg bitmap_bit_count bitmap_or_agg bitnot bitor bitor_agg
syn keyword sqlFunction	bitshiftleft bitshiftright bitxor bitxor_agg booland booland_agg boolnot boolor
syn keyword sqlFunction	boolor_agg boolxor boolxor_agg case cast cbrt ceil charindex check_json
syn keyword sqlFunction	check_xml chr char coalesce collate collation compress concat concat_ws
syn keyword sqlFunction	conditional_change_event conditional_true_event convert_timezone
syn keyword sqlFunction	copy_history corr cos cosh cot count count_if covar_pop covar_samp cume_dist
syn keyword sqlFunction	current_account current_available_roles current_client current_database
syn keyword sqlFunction	current_date current_ip_address current_region current_role current_schema
syn keyword sqlFunction	current_schemas current_session current_statement current_time current_timestamp
syn keyword sqlFunction	current_transaction current_user current_version current_warehouse
syn keyword sqlFunction	data_transfer_history database_refresh_history database_refresh_progress
syn keyword sqlFunction	database_refresh_progress_by_job database_storage_usage_history date_from_parts
syn keyword sqlFunction	date_part date_trunc dateadd datediff dayname decode decompress_binary
syn keyword sqlFunction	decompress_string decrypt decrypt_raw degrees dense_rank div0 editdistance
syn keyword sqlFunction	encrypt encrypt_raw endswith equal_null exp explain_json
syn keyword sqlFunction	external_functions_history external_table_files
syn keyword sqlFunction	external_table_file_registration_history extract factorial first_value flatten
syn keyword sqlFunction	floor generate_column_description generator get get_absolute_path get_ddl
syn keyword sqlFunction	get_ignore_case get_object_references get_path get_presigned_url
syn keyword sqlFunction	get_relative_path get_stage_location getbit greatest grouping grouping_id hash
syn keyword sqlFunction	hash_agg haversine hex_decode_binary hex_decode_string hex_encode hll
syn keyword sqlFunction	hll_accumulate hll_combine hll_estimate hll_export hll_import iff ifnull ilike
syn keyword sqlFunction	ilike any in infer_schema initcap insert invoker_role invoker_share
syn keyword sqlFunction	is_array is_binary is_boolean is_decimal is_granted_to_invoker_role is_integer
syn keyword sqlFunction	is_null_value is_object is_role_in_session is_time is_timestamp_ltz
syn keyword sqlFunction	is_timestamp_ntz is_timestamp_tz json_extract_path_text kurtosis lag last_day
syn keyword sqlFunction	last_query_id last_transaction last_value lead least left length len like like
syn keyword sqlFunction	all like any listagg ln localtime localtimestamp log login_history
syn keyword sqlFunction	login_history_by_user lower lpad ltrim materialized_view_refresh_history md5
syn keyword sqlFunction	md5_hex md5_binary md5_number — oBSOLETED md5_number_lower64 md5_number_upper64
syn keyword sqlFunction	median min / max minhash minhash_combine mod mode monthname months_between
syn keyword sqlFunction	next_day normal nth_value ntile nullif nullifzero nvl nvl2 object_agg
syn keyword sqlFunction	object_construct object_construct_keep_null object_delete object_insert
syn keyword sqlFunction	object_keys object_pick octet_length parse_ip parse_json parse_url parse_xml
syn keyword sqlFunction	percent_rank percentile_cont percentile_disc pi pipe_usage_history
syn keyword sqlFunction	policy_context policy_references position pow power previous_day query_history
syn keyword sqlFunction	query_history_by_session query_history_by_user query_history_by_warehouse
syn keyword sqlFunction	radians random randstr rank ratio_to_report regexp regexp_count regexp_instr
syn keyword sqlFunction	regexp_like regexp_replace regexp_substr regr_avgx regr_avgy regr_count
syn keyword sqlFunction	regr_intercept regr_r2 regr_slope regr_sxx regr_sxy regr_syy regr_valx regr_valy
syn keyword sqlFunction	repeat replace replication_usage_history rest_event_history result_scan reverse
syn keyword sqlFunction	right rlike round row_number rpad rtrim rtrimmed_length
syn keyword sqlFunction	search_optimization_history seq1 seq2 seq4 seq8 serverless_task_history sha1
syn keyword sqlFunction	sha1_hex sha1_binary sha2 sha2_hex sha2_binary sign sin sinh skew soundex space
syn keyword sqlFunction	split split_part split_to_table sqrt square st_area st_asewkb st_asewkt
syn keyword sqlFunction	st_asgeojson st_aswkb st_asbinary st_aswkt st_astext st_azimuth st_centroid
syn keyword sqlFunction	st_collect st_contains st_coveredby st_covers st_dimension st_disjoint
syn keyword sqlFunction	st_distance st_dwithin st_envelope st_geogfromgeohash st_geogpointfromgeohash
syn keyword sqlFunction	st_geographyfromwkb st_geographyfromwkt st_geohash st_hausdorffdistance
syn keyword sqlFunction	st_intersects st_length st_makeline st_makepoint st_point st_makepolygon
syn keyword sqlFunction	st_polygon st_npoints st_numpoints st_perimeter st_simplify st_srid st_within
syn keyword sqlFunction	st_x st_xmax st_xmin st_y st_ymax st_ymin stage_storage_usage_history startswith
syn keyword sqlFunction	stddev stddev_pop stddev_samp strip_null_value strtok strtok_split_to_table
syn keyword sqlFunction	strtok_to_array substr substring sum sysdate system$abort_session
syn keyword sqlFunction	system$abort_transaction system$behavior_change_bundle_status
syn keyword sqlFunction	system$cancel_all_queries system$cancel_query system$clustering_depth
syn keyword sqlFunction	system$clustering_information system$clustering_ratio
syn keyword sqlFunction	system$current_user_task_name system$database_refresh_history
syn keyword sqlFunction	system$database_refresh_progress system$database_refresh_progress_by_job
syn keyword sqlFunction	system$disable_behavior_change_bundle system$enable_behavior_change_bundle
syn keyword sqlFunction	system$estimate_search_optimization_costs system$explain_json_to_text
syn keyword sqlFunction	system$explain_plan_json system$external_table_pipe_status
syn keyword sqlFunction	system$generate_saml_csr system$generate_scim_access_token
syn keyword sqlFunction	system$get_aws_sns_iam_policy system$get_predecessor_return_value
syn keyword sqlFunction	system$get_privatelink_config system$get_snowflake_platform_info system$get_tag
syn keyword sqlFunction	system$global_account_set_parameter system$last_change_commit_time
syn keyword sqlFunction	system$migrate_saml_idp_registration system$pipe_force_resume system$pipe_status
syn keyword sqlFunction	system$set_return_value system$show_oauth_client_secrets
syn keyword sqlFunction	system$stream_get_table_timestamp system$stream_has_data
syn keyword sqlFunction	system$task_dependents_enable system$typeof
syn keyword sqlFunction	system$user_task_cancel_ongoing_executions system$verify_external_oauth_token
syn keyword sqlFunction	system$wait system$whitelist system$whitelist_privatelink tag_references
syn keyword sqlFunction	tag_references_with_lineage tan tanh task_dependents task_history
syn keyword sqlFunction	time_from_parts time_slice timeadd timediff timestamp_from_parts timestampadd
syn keyword sqlFunction	timestampdiff to_array to_binary to_boolean to_char to_varchar to_date date
syn keyword sqlFunction	to_decimal to_number to_numeric to_double to_geography to_json to_object to_time
syn keyword sqlFunction	time to_timestamp to_timestamp_ltz to_timestamp_ntz to_timestamp_tz to_variant
syn keyword sqlFunction	to_xml translate trim truncate trunc trunc try_base64_decode_binary
syn keyword sqlFunction	try_base64_decode_string try_cast try_hex_decode_binary try_hex_decode_string
syn keyword sqlFunction	try_parse_json try_to_binary try_to_boolean try_to_date try_to_decimal
syn keyword sqlFunction	try_to_number try_to_numeric try_to_double try_to_geography try_to_time
syn keyword sqlFunction	try_to_timestamp try_to_timestamp_ltz try_to_timestamp_ntz try_to_timestamp_tz
syn keyword sqlFunction	typeof unicode uniform upper uuid_string validate validate_pipe_load var_pop
syn keyword sqlFunction	var_samp variance variance_samp variance_pop warehouse_load_history
syn keyword sqlFunction	warehouse_metering_history width_bucket xmlget year yearofweek yearofweekiso day
syn keyword sqlFunction	dayofmonth dayofweek dayofweekiso dayofyear week weekofyear weekiso month
syn keyword sqlFunction	quarter zeroifnull zipf


" Types:
" Numeric:
syn keyword sqlType	number decimal numeric 
syn keyword sqlType	int integer bigint smallint tinyint
syn keyword sqlType	byteint float float4 float8
syn keyword sqlType	real
" double precision first, so that the match doesn't get double on its own and
" leave precision unhighlighted
syn match sqlType	/double precision\|double/ 

" String and Binary:
syn keyword sqlType	varchar char character string text
syn keyword sqlType	binary varbinary

" Logical:
syn keyword sqlType	boolean

" Date and Time:
syn keyword sqlType	date datetime
syn keyword sqlType	time timestamp timestamp_ltz timestamp_ntz timestamp_tz

" Semi-structured:
syn keyword sqlType	variant object array

" Geospatial:
syn keyword sqlType	geography

syn keyword sqlOperator	not and or
syn keyword sqlOperator	in any some all between exists
syn keyword sqlOperator	like escape
syn keyword sqlOperator	union intersect minus
syn keyword sqlOperator	prior distinct

" Define the default highlighting.
hi def link Quote		Special
hi def link sqlComment		Comment
hi def link sqlFunction		Function
hi def link sqlKeyword		sqlSpecial
hi def link sqlNumber		Number
hi def link sqlOperator		sqlStatement
hi def link sqlSpecial		Special
hi def link sqlStatement	Statement
hi def link sqlString		String
hi def link sqlType		Type
hi def link sqlTodo		Todo

let b:current_syntax = "sql"
" vim: ts=8
