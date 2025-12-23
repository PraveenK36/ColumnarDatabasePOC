CREATE DATABASE IF NOT EXISTS app;

CREATE TABLE IF NOT EXISTS app.users
(
    user_id UInt64,
    preferred_movie_genere LowCardinality(String),
    state_province_code LowCardinality(String),
    country_code FixedString(2)
    )
    ENGINE = MergeTree
    ORDER BY user_id;
