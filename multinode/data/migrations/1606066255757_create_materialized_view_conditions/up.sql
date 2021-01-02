CREATE MATERIALIZED VIEW conditions_summary_hourly  AS
    SELECT time_bucket(INTERVAL '1h', time) AS bucket,
           AVG(temperature),
           MAX(temperature),
           MIN(temperature)
    FROM conditions
    GROUP BY bucket;
    
CREATE OR REPLACE PROCEDURE conditions_summary_hourly_refresh(job_id int, config jsonb) LANGUAGE PLPGSQL AS
$$
BEGIN
  REFRESH MATERIALIZED VIEW conditions_summary_hourly;     
END
$$;

SELECT add_job('conditions_summary_hourly_refresh','1h');
