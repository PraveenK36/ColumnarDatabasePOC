CREATE DATABASE IF NOT EXISTS app;
USE app;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
                       user_id BIGINT NOT NULL,
                       preferred_movie_genere VARCHAR(64) NOT NULL,
                       state_province_code CHAR(2) NOT NULL,
                       country_code CHAR(2) NOT NULL,
                       PRIMARY KEY (user_id)
);
