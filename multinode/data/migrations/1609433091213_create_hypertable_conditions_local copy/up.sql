CREATE TABLE local_conditions (
  time        TIMESTAMPTZ       NOT NULL DEFAULT NOW(),
  location    TEXT              NOT NULL,
  temperature DOUBLE PRECISION  NULL,
  humidity    DOUBLE PRECISION  NULL
);

SELECT create_hypertable('local_conditions', 'time');
