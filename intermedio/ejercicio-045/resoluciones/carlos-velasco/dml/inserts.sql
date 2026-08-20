USE campuslands_mysql;

INSERT INTO videojuegos (
    titulo,
    genero,
    plataforma,
    desarrollador,
    anio_lanzamiento,
    precio,
    puntuacion,
    estado
) VALUES
(
    'Elden Ring',
    'RPG',
    'PC',
    'FromSoftware',
    2022,
    59.99,
    9.5,
    'disponible'
),
(
    'The Legend of Zelda: Tears of the Kingdom',
    'Aventura',
    'Nintendo Switch',
    'Nintendo',
    2023,
    69.99,
    9.7,
    'prestado'
),
(
    'God of War Ragnarök',
    'Accion',
    'PlayStation 5',
    'Santa Monica Studio',
    2022,
    69.99,
    9.3,
    'disponible'
),
(
    'Forza Horizon 5',
    'Carreras',
    'Xbox Series X',
    'Playground Games',
    2021,
    49.99,
    9.0,
    'disponible'
),
(
    'Baldur''s Gate 3',
    'RPG',
    'PC',
    'Larian Studios',
    2023,
    59.99,
    9.8,
    'prestado'
),
(
    'Resident Evil 4',
    'Terror',
    'PlayStation 5',
    'Capcom',
    2023,
    59.99,
    9.2,
    'disponible'
),
(
    'Halo Infinite',
    'Shooter',
    'Xbox Series X',
    '343 Industries',
    2021,
    39.99,
    8.5,
    'mantenimiento'
),
(
    'Hades',
    'Roguelike',
    'PC',
    'Supergiant Games',
    2020,
    24.99,
    9.1,
    'disponible'
),
(
    'Cyberpunk 2077',
    'RPG',
    'PC',
    'CD Projekt Red',
    2020,
    49.99,
    8.8,
    'disponible'
),
(
    'Mario Kart 8 Deluxe',
    'Carreras',
    'Nintendo Switch',
    'Nintendo',
    2017,
    59.99,
    9.0,
    'prestado'
);