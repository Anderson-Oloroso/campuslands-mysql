USE campuslands_mysql;

INSERT INTO videojuegos (
    titulo,
    genero,
    plataforma,
    precio,
    puntaje,
    estado,
    fecha_lanzamiento
)
VALUES
    ('The Witcher 3', 'RPG', 'PC', 39.99, 9.70, 'disponible', '2015-05-19'),
    ('Elden Ring', 'RPG', 'PC', 59.99, 9.50, 'prestado', '2022-02-25'),
    ('Final Fantasy VII Rebirth', 'RPG', 'PS5', 69.99, 9.20, 'disponible', '2024-02-29'),
    ('God of War Ragnarok', 'Accion', 'PS5', 59.99, 9.60, 'prestado', '2022-11-09'),
    ('Doom Eternal', 'Accion', 'PC', 29.99, 9.00, 'disponible', '2020-03-20'),
    ('Red Dead Redemption 2', 'Aventura', 'PC', 49.99, 9.80, 'disponible', '2018-10-26'),
    ('Uncharted 4', 'Aventura', 'PS4', 24.99, 9.10, 'prestado', '2016-05-10'),
    ('Civilization VI', 'Estrategia', 'PC', 34.99, 8.80, 'disponible', '2016-10-21'),
    ('StarCraft II', 'Estrategia', 'PC', 19.99, 9.00, 'disponible', '2010-07-27'),
    ('EA Sports FC 26', 'Deportes', 'PS5', 64.99, 8.20, 'prestado', '2025-09-26'),
    ('Forza Horizon 5', 'Carreras', 'Xbox Series X', 54.99, 9.30, 'disponible', '2021-11-09'),
    ('Hades', 'Roguelike', 'Nintendo Switch', 24.99, 9.40, 'prestado', '2020-09-17');