CREATE DATABASE IF NOT EXISTS app;

CREATE TABLE IF NOT EXISTS app.users
(
    user_id UInt64,
    first_name String,
    last_name String,
    full_name String,
    state_province_code LowCardinality(String),
    country_code FixedString(2)
    )
    ENGINE = MergeTree
    ORDER BY user_id;
