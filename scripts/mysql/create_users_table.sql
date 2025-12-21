CREATE DATABASE IF NOT EXISTS app;
USE app;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
                       user_id BIGINT NOT NULL,
                       first_name VARCHAR(64) NOT NULL,
                       last_name VARCHAR(64) NOT NULL,
                       full_name VARCHAR(128) NOT NULL,
                       state_province_code CHAR(2) NOT NULL,
                       country_code CHAR(2) NOT NULL,
                       PRIMARY KEY (user_id),
                       UNIQUE KEY uniq_first_name (first_name),
                       UNIQUE KEY uniq_last_name (last_name)
);
