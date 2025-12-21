docker run -d \
  --name clickhouse \
  -p 8123:8123 \
  -p 9000:9000 \
  -v clickhouse_data:/var/lib/clickhouse \
  -v clickhouse_logs:/var/log/clickhouse-server \
  clickhouse/clickhouse-server:latest
