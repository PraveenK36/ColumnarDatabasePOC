INSERT INTO app.users
SELECT
    user_id,
    preferred_movie_genere,
    state_province_code,
    country_code
FROM
    (
        SELECT
            number + 1 AS user_id,
            generes[(number % length(states)) + 1] AS state_province_code,
            states[(number % length(states)) + 1] AS preferred_movie_genere,
            countries[(number % length(countries)) + 1] AS country_code
        FROM
            (
                SELECT
                    [
                    'AL','AK','AZ','AR','CA',
                    'CO','CT','DE','FL','GA',
                    'HI','ID','IL','IN','IA',
                    'KS','KY','LA','ME','MD',
                    'MA','MI','MN','MS','MO',
                    'MT','NE','NV','NH','NJ',
                    'NM','NY','NC','ND','OH',
                    'OK','OR','PA','RI','SC',
                    'SD','TN','TX','UT','VT',
                    'VA','WA','WV','WI','WY',
                    'DC'
                    ] AS states,
                    [
                    'Action',
                    'Adventure',
                    'Comedy',
                    'Drama',
                    'Thriller',
                    'Horror',
                    'Romance',
                    'Crime',
                    'Mystery',
                    'Science Fiction',
                    'Fantasy',
                    'Superhero',
                    'Tragedy',
                    'Melodrama',
                    'Feel-good',
                    'Biography',
                    'Historical',
                    'War',
                    'Political',
                    'Family',
                    'Animation',
                    'Children',
                    'Western',
                    'Musical',
                    'Sports',
                    'Mythological',
                    'Action-Comedy',
                    'Romantic-Comedy',
                    'Sci-Fi Thriller',
                    'Horror-Comedy'
                    ]
                    AS generes,
                    [
                    'US','CA','GB','DE','FR','IN','AU'
                    ] AS countries
            ) AS dicts
                CROSS JOIN numbers(10000000) AS seq
    ) AS generated;
