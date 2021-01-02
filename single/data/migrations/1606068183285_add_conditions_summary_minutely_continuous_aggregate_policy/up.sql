SELECT add_continuous_aggregate_policy('conditions_summary_minutely',
    start_offset => INTERVAL '2 h',
    end_offset => INTERVAL '1 h',
    schedule_interval => INTERVAL '1 h');
