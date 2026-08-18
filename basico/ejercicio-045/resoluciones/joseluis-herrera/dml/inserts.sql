USE campuslands_mysql;

INSERT INTO categorias (nombre)
VALUES
    ('RPG'),
    ('Accion'),
    ('Aventura'),
    ('Estrategia'),
    ('Deportes');

INSERT INTO videojuegos (
    titulo,
    plataforma,
    precio,
    puntaje,
    estado,
    id_categoria
)
VALUES
    ('The Witcher 3', 'PC', 39.99, 9.70, 'disponible', 1),
    ('Elden Ring', 'PC', 59.99, 9.50, 'prestado', 1),
    ('Final Fantasy VII Rebirth', 'PS5', 69.99, 9.20, 'disponible', 1),
    ('God of War Ragnarok', 'PS5', 59.99, 9.60, 'prestado', 2),
    ('Doom Eternal', 'PC', 29.99, 9.00, 'disponible', 2),
    ('Red Dead Redemption 2', 'PC', 49.99, 9.80, 'disponible', 3),
    ('Uncharted 4', 'PS4', 24.99, 9.10, 'prestado', 3),
    ('Civilization VI', 'PC', 34.99, 8.80, 'disponible', 4),
    ('StarCraft II', 'PC', 19.99, 9.00, 'disponible', 4),
    ('EA Sports FC 26', 'PS5', 64.99, 8.20, 'prestado', 5);