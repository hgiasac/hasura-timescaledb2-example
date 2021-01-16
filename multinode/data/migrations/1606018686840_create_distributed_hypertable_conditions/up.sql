CREATE OR REPLACE PROCEDURE data_node_maintenance(job_id int, config jsonb)
LANGUAGE SQL AS
$$
    SELECT _timescaledb_internal.remote_txn_heal_data_node(fs.oid)
    FROM pg_foreign_server fs, pg_foreign_data_wrapper fdw
    WHERE fs.srvfdw = fdw.oid
    AND fdw.fdwname = 'timescaledb_fdw';
$$;

SELECT add_job('data_node_maintenance', '5m');

CREATE TABLE conditions (
  time        TIMESTAMPTZ       NOT NULL DEFAULT NOW(),
  location    TEXT              NOT NULL,
  temperature DOUBLE PRECISION  NULL,
  humidity    DOUBLE PRECISION  NULL
);

SELECT create_distributed_hypertable('conditions', 'time');

CREATE OR REPLACE FUNCTION "public"."conditions_set_default_location"()
  RETURNS TRIGGER AS $$
    DECLARE
    _new record;
    BEGIN
      _new := NEW;
      IF NOT (_new."location" <> '') THEN
        _new."location" = 'EU';
      END IF;

      RETURN _new;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER "conditions_set_default_location"
  BEFORE INSERT OR UPDATE ON "public"."conditions"
  FOR EACH ROW
  EXECUTE PROCEDURE "public"."conditions_set_default_location"();
