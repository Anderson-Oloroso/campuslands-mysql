USE ejercicio_13_adv;

INSERT INTO movies (
    title,
    release_year,
    genre,
    duration_minutes,
    movie_data
) VALUES
(
    'The Shadow House',
    2021,
    'Horror',
    110,
    '{
        "rating": 8.1,
        "country": "United States",
        "budget": 12000000,
        "actors": ["Ethan Cole", "Sarah Miller"],
        "themes": ["Haunted House", "Supernatural"]
    }'
),
(
    'Night Whispers',
    2022,
    'Psychological Horror',
    105,
    '{
        "rating": 7.8,
        "country": "Canada",
        "budget": 9000000,
        "actors": ["Daniel Brooks", "Emma Stone"],
        "themes": ["Psychological", "Mystery"]
    }'
),
(
    'The Last Ritual',
    2023,
    'Supernatural Horror',
    118,
    '{
        "rating": 8.5,
        "country": "United Kingdom",
        "budget": 15000000,
        "actors": ["James Carter", "Olivia Reed"],
        "themes": ["Demon", "Ritual"]
    }'
),
(
    'Forest of Screams',
    2020,
    'Creature Horror',
    98,
    '{
        "rating": 7.4,
        "country": "Australia",
        "budget": 7000000,
        "actors": ["Lucas Ward", "Mia Turner"],
        "themes": ["Creature", "Forest"]
    }'
),
(
    'Midnight Curse',
    2024,
    'Occult Horror',
    125,
    '{
        "rating": 8.7,
        "country": "United States",
        "budget": 18000000,
        "actors": ["Noah Blake", "Sophia Evans"],
        "themes": ["Curse", "Occult"]
    }'
),
(
    'The Silent Room',
    2019,
    'Psychological Horror',
    102,
    '{
        "rating": 7.9,
        "country": "Ireland",
        "budget": 6000000,
        "actors": ["Henry Moore", "Emily Clark"],
        "themes": ["Isolation", "Psychological"]
    }'
);

INSERT INTO directors (director_name, country) VALUES
('Michael Anderson', 'United States'),
('Laura Bennett', 'Canada'),
('Robert Williams', 'United Kingdom'),
('Thomas Wilson', 'Australia'),
('James Morrison', 'United States'),
('Daniel Foster', 'Ireland');

INSERT INTO movie_directors (movie_id, director_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);