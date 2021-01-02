DROP MATERIALIZED VIEW conditions_summary_minutely;
SELECT delete_job(job_id) FROM timescaledb_information.jobs 
  where proc_name = 'conditions_summary_hourly_refresh';
DROP PROCEDURE conditions_summary_hourly_refresh;
