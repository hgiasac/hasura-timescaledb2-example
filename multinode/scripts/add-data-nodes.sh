#!/bin/bash
set -e

if [ -z $TIMESCALE_DATA_NODES ]; then
  exit 0
fi

for node in ${TIMESCALE_DATA_NODES//,/ } ; do 
  RETRIES=100
  until psql -h "$node" -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
    echo "Waiting for postgres server, $((RETRIES--)) remaining attempts..."
    sleep 1
  done

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
  SELECT add_data_node('$node', host => '$node');
EOSQL
done
