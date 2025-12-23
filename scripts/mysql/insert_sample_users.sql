INSERT INTO app.users (
    user_id,
    preferred_movie_genere,
    state_province_code,
    country_code
)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 10000000
)
SELECT
    n,
    ELT((n % 30) + 1,
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
    ),
    ELT((n % 50) + 1,
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
    ),
    ELT((n % 7) + 1,
        'US','CA','GB','DE','FR','IN','AU'
    )
FROM seq;