CREATE MATERIALIZED VIEW conditions_summary_minutely
    WITH (timescaledb.continuous) AS
    SELECT time_bucket(INTERVAL '1 minute', time) AS bucket,
           AVG(temperature),
           MAX(temperature),
           MIN(temperature)
    FROM conditions
    GROUP BY bucket;
