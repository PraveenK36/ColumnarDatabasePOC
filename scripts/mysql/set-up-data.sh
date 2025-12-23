#!/usr/bin/env bash
set -e

MYSQL_CONTAINER=mysql-app
MYSQL_USER=praveen
MYSQL_PASSWORD=test123

MYSQL_CMD="mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD}"

echo "Creating users table..."
docker exec -i ${MYSQL_CONTAINER} ${MYSQL_CMD} < create_users_table.sql

echo "Setting recursion limit and inserting users..."
docker exec -i ${MYSQL_CONTAINER} ${MYSQL_CMD} <<EOF
SET SESSION cte_max_recursion_depth = 10000000;
$(cat insert_sample_users.sql)
EOF

echo "Verifying..."
docker exec -i ${MYSQL_CONTAINER} ${MYSQL_CMD} \
  -e "SELECT COUNT(*) FROM app.users;"

echo "Done."