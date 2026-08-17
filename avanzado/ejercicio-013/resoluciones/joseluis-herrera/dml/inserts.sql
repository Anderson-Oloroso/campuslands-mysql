USE campuslands_mysql;

INSERT INTO peliculas
(titulo, categoria, anio, puntaje, estado, detalles)
VALUES
(
    'El Conjuro',
    'Sobrenatural',
    2013,
    8.5,
    'activo',
    '{
        "director": "James Wan",
        "duracion_minutos": 112,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Vera Farmiga", "Patrick Wilson"],
        "plataformas": ["Max", "Prime Video"],
        "clasificacion": "R"
    }'
),
(
    'Insidious',
    'Sobrenatural',
    2010,
    8.1,
    'activo',
    '{
        "director": "James Wan",
        "duracion_minutos": 103,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Patrick Wilson", "Lin Shaye"],
        "plataformas": ["Netflix", "Prime Video"],
        "clasificacion": "PG-13"
    }'
),
(
    'Scream',
    'Slasher',
    1996,
    7.9,
    'activo',
    '{
        "director": "Wes Craven",
        "duracion_minutos": 111,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Neve Campbell", "Courteney Cox"],
        "plataformas": ["Paramount+"],
        "clasificacion": "R"
    }'
),
(
    'Halloween',
    'Slasher',
    1978,
    8.3,
    'activo',
    '{
        "director": "John Carpenter",
        "duracion_minutos": 91,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Jamie Lee Curtis"],
        "plataformas": ["Prime Video"],
        "clasificacion": "R"
    }'
),
(
    'Hereditary',
    'Psicologico',
    2018,
    8.7,
    'activo',
    '{
        "director": "Ari Aster",
        "duracion_minutos": 127,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Toni Collette", "Alex Wolff"],
        "plataformas": ["Max"],
        "clasificacion": "R"
    }'
),
(
    'The Ring',
    'Sobrenatural',
    2002,
    7.8,
    'inactivo',
    '{
        "director": "Gore Verbinski",
        "duracion_minutos": 115,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Naomi Watts", "Martin Henderson"],
        "plataformas": ["Prime Video"],
        "clasificacion": "PG-13"
    }'
),
(
    'Saw',
    'Gore',
    2004,
    7.6,
    'activo',
    '{
        "director": "James Wan",
        "duracion_minutos": 103,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Tobin Bell", "Cary Elwes"],
        "plataformas": ["Netflix"],
        "clasificacion": "R"
    }'
),
(
    'It Follows',
    'Psicologico',
    2014,
    7.5,
    'inactivo',
    '{
        "director": "David Robert Mitchell",
        "duracion_minutos": 100,
        "idiomas": ["Español", "Inglés"],
        "actores": ["Maika Monroe", "Keir Gilchrist"],
        "plataformas": ["Prime Video"],
        "clasificacion": "R"
    }'
),
(
    'Midsommar',
    'Psicologico',
    2019,
    8.2,
    'activo',
    '{
        "director": "Ari Aster",
        "duracion_minutos": 148,
        "idiomas": ["Español", "Inglés", "Sueco"],
        "actores": ["Florence Pugh", "Jack Reynor"],
        "plataformas": ["Max"],
        "clasificacion": "R"
    }'
),
(
    'Terrifier',
    'Slasher',
    2016,
    6.9,
    'inactivo',
    '{
        "director": "Damien Leone",
        "duracion_minutos": 82,
        "idiomas": ["Español", "Inglés"],
        "actores": ["David Howard Thornton"],
        "plataformas": ["Prime Video"],
        "clasificacion": "R"
    }'
);