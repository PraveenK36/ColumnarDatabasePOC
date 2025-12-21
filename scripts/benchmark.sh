#!/usr/bin/env bash
set -e

ITERATIONS=10

echo "Paired benchmark: COUNT users where state = 'TX'"
echo "Iterations: ${ITERATIONS}"
echo
printf "%-10s %-15s %-15s\n" "Run" "ClickHouse(ms)" "MySQL(ms)"
printf "%-10s %-15s %-15s\n" "----" "---------------" "----------"

for i in $(seq 1 ${ITERATIONS}); do
  # ClickHouse
  CH_START=$(date +%s%N)
  docker exec -i clickhouse clickhouse-client \
    --query "SELECT count() FROM app.users WHERE state_province_code = 'TX';" \
    > /dev/null
  CH_END=$(date +%s%N)
  CH_MS=$(( (CH_END - CH_START) / 1000000 ))

  # MySQL
  MY_START=$(date +%s%N)
  docker exec -i mysql-app mysql -upraveen -ptest123 \
    -e "SELECT COUNT(*) FROM app.users WHERE state_province_code = 'TX';" \
    > /dev/null
  MY_END=$(date +%s%N)
  MY_MS=$(( (MY_END - MY_START) / 1000000 ))

  printf "%-10s %-15s %-15s\n" "$i" "$CH_MS" "$MY_MS"
done
