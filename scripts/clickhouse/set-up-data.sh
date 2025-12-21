#!/usr/bin/env bash
set -e

CLICKHOUSE_CONTAINER=clickhouse

echo "Creating tables..."
docker exec -i ${CLICKHOUSE_CONTAINER} clickhouse-client < create_users_table.sql

echo "Inserting sample data..."
docker exec -i ${CLICKHOUSE_CONTAINER} clickhouse-client < insert_sample_users.sql

echo "Verifying row count..."
docker exec -i ${CLICKHOUSE_CONTAINER} clickhouse-client \
  --query "SELECT count() FROM app.users"

echo "Done."
