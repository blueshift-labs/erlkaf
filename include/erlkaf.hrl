
% default partitioner

-define(DEFULT_PARTITIONER, -1).

% types

-type client_id() :: atom().
-type reason() :: any().
-type state() :: any().
-type key() :: undefined | binary().
-type partition() :: ?DEFULT_PARTITIONER | integer().
-type partition_assignment_strategy() :: range |roundrobin.
-type compression_codec() :: none | gzip | snappy | lz4 | inherit.
-type offset_reset() :: smallest | earliest | beginning | largest | latest.
-type ip_family() :: any| v4| v6.
-type security_protocol() :: plaintext | ssl | sasl_plaintext | sasl_ssl.
-type overflow_strategy() :: local_disk_queue | block_calling_process | drop_records.
-type partitioner() :: random|consistent|consistent_random|murmur2|murmur2_random.
-type headers() :: undefined | proplists:proplist() | maps:map().

-type topic_option() ::
    {request_required_acks, integer()} |
    {request_timeout_ms, integer()} |
    {message_timeout_ms, integer()} |
    {compression_codec, compression_codec()} |
    {compression_level, integer()} |
    {auto_commit_interval_ms, integer()} |
    {auto_offset_reset, offset_reset()} |
    {partitioner, partitioner()} |
    {offset_store_path, binary()} |
    {offset_store_sync_interval_ms, integer()}.

-type client_option() ::
    {client_id, binary()} |
    {bootstrap_servers, binary()} |
    {message_max_bytes, integer()} |
    {message_copy_max_bytes, integer()} |
    {receive_message_max_bytes, integer()} |
    {max_in_flight, integer()} |
    {metadata_request_timeout_ms, integer()} |
    {topic_metadata_refresh_interval_ms, integer()} |
    {metadata_max_age_ms, integer()} |
    {topic_metadata_refresh_fast_interval_ms, integer()} |
    {topic_metadata_refresh_sparse, boolean()} |
    {topic_blacklist, binary()} |
    {socket_timeout_ms, integer()} |
    {socket_send_buffer_bytes, integer()} |
    {socket_receive_buffer_bytes, integer()} |
    {socket_keepalive_enable, boolean()} |
    {socket_nagle_disable, boolean()} |
    {socket_max_fails, integer()} |
    {broker_address_ttl, integer()} |
    {broker_address_family, ip_family()} |
    {reconnect_backoff_ms, integer()} |
    {reconnect_backoff_max_ms, integer()} |
    {statistics_interval_ms, integer()} |
    {log_level, integer()} |
    {log_connection_close, boolean()} |
    {api_version_request, boolean()} |
    {api_version_fallback_ms, integer()} |
    {broker_version_fallback, boolean()} |
    {security_protocol, security_protocol()} |
    {ssl_cipher_suites, binary()} |
    {ssl_curves_list, binary()} |
    {ssl_sigalgs_list, binary()} |
    {ssl_key_location, binary()} |
    {ssl_key_password, binary()} |
    {ssl_certificate_location, binary()} |
    {ssl_ca_location, binary()} |
    {ssl_crl_location, binary()} |
    {ssl_keystore_location, binary()} |
    {ssl_keystore_password, binary()} |
    {sasl_mechanisms, binary()} |
    {sasl_kerberos_service_name, binary()} |
    {sasl_kerberos_principal, binary()} |
    {sasl_kerberos_kinit_cmd, binary()} |
    {sasl_kerberos_keytab, binary()} |
    {sasl_kerberos_min_time_before_relogin, integer()} |
    {sasl_username, binary()} |
    {sasl_password, binary()} |
    {session_timeout_ms, integer()} |
    {partition_assignment_strategy, partition_assignment_strategy()} |
    {heartbeat_interval_ms, integer()} |
    {coordinator_query_interval_ms, integer()} |
    {max_poll_interval_ms, integer()} |
    {auto_commit_interval_ms, integer()} |
    {queued_min_messages, integer()} |
    {queued_max_messages_kbytes, integer()} |
    {fetch_wait_max_ms, integer()} |
    {fetch_message_max_bytes, integer()} |
    {fetch_max_bytes, integer()} |
    {fetch_min_bytes, integer()} |
    {fetch_error_backoff_ms, integer()} |
    {isolation_level, binary()} |
    {check_crcs, boolean()} |
    {enable_idempotence, boolean()} |
    {enable_gapless_guarantee, boolean()} |
    {queue_buffering_max_messages, integer()} |
    {queue_buffering_max_kbytes, integer()} |
    {queue_buffering_max_ms, integer()} |
    {queue_buffering_overflow_strategy, overflow_strategy()} |
    {message_send_max_retries, integer()} |
    {retry_backoff_ms, integer()} |
    {compression_codec, compression_codec()} |
    {batch_num_messages, integer()} |
    {delivery_report_only_error, boolean()} |
    {plugin_library_paths, binary()}.

% records

-record(erlkaf_msg, {
    topic :: binary(),
    partition ::non_neg_integer(),
    offset ::integer(),
    key :: key(),
    value ::binary(),
    headers :: headers()
}).

