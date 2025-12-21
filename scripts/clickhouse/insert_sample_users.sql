INSERT INTO app.users
SELECT
    user_id,
    first_name,
    last_name,
    concat(first_name, ' ', last_name) AS full_name,
    state_province_code,
    country_code
FROM
    (
        SELECT
            number + 1 AS user_id,

            -- guaranteed unique
            concat('FirstName_', toString(number + 1)) AS first_name,
            concat('LastName_', toString(number + 1)) AS last_name,

            states[(number % length(states)) + 1] AS state_province_code,
            countries[(number % length(countries)) + 1] AS country_code
        FROM
            (
                SELECT
                    [
                    'CA','NY','TX','WA','FL','IL','MA','NJ','VA','GA',
                    'AZ','CO','NC','SC','MD','DC','OR','NV','UT','PA'
                    ] AS states,

                    [
                    'US','CA','GB','DE','FR','IN','AU'
                    ] AS countries
            ) AS dicts
                CROSS JOIN numbers(1000000) AS seq
    ) AS generated;
