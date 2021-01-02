INSERT INTO local_conditions
SELECT time, 'US', (random()*30)::int, random()*80
FROM generate_series(
  '2020-01-01 00:00:00'::timestamptz, 
  '2020-01-01 00:00:00'::timestamptz + INTERVAL '999999 seconds', 
  '1 second'
) AS time;
