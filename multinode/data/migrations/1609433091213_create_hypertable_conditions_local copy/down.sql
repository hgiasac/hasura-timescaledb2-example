DROP TABLE conditions CASCADE;
SELECT delete_job(job_id) FROM timescaledb_information.jobs 
  where proc_name = 'data_node_maintenance';
DROP PROCEDURE data_node_maintenance;
