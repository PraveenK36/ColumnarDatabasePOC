INSERT INTO app.users (
    user_id,
    first_name,
    last_name,
    full_name,
    state_province_code,
    country_code
)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 1000000
)
SELECT
    n,
    CONCAT('FirstName_', n),
    CONCAT('LastName_', n),
    CONCAT('FirstName_', n, ' ', 'LastName_', n),
    ELT((n % 20) + 1,
        'CA','NY','TX','WA','FL','IL','MA','NJ','VA','GA',
        'AZ','CO','NC','SC','MD','DC','OR','NV','UT','PA'
    ),
    ELT((n % 7) + 1,
        'US','CA','GB','DE','FR','IN','AU'
    )
FROM seq;