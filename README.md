# Step 1: Install clickhouse
cd clickhouse
bash clickhouse-install.sh

# Step 2: Set up data in clickhouse
bash set-up-data.sh

# Step3: Install My SQL
cd ../mysql
bash mysql-install.sh

# Step 4: Set up data in MySQL
bash set-up-data.sh

# Step 5: Run Benchmark Analysis
bash benchmark.sh




