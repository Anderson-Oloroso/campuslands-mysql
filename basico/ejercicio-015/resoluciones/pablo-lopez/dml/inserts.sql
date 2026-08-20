-- ============================================================
-- Ejercicio 015 - Relaciones simples para biblioteca gamer
-- Archivo: dml/inserts.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- Insertar categorías
-- ============================================================

INSERT INTO categorias (nombre)
VALUES
    ('Acción'),
    ('Aventura'),
    ('RPG'),
    ('Deportes'),
    ('Estrategia');

-- ============================================================
-- Insertar videojuegos
-- ============================================================

INSERT INTO juegos (
    titulo,
    plataforma,
    puntaje,
    precio,
    fecha_lanzamiento,
    estado,
    id_categoria
)
VALUES
    (
        'Cyberpunk 2077',
        'PC',
        8.8,
        49.99,
        '2020-12-10',
        'activo',
        1
    ),
    (
        'The Legend of Zelda: Breath of the Wild',
        'Nintendo Switch',
        9.7,
        59.99,
        '2017-03-03',
        'activo',
        2
    ),
    (
        'Elden Ring',
        'PlayStation 5',
        9.5,
        69.99,
        '2022-02-25',
        'activo',
        3
    ),
    (
        'EA Sports FC 25',
        'PlayStation 5',
        8.1,
        54.99,
        '2024-09-27',
        'activo',
        4
    ),
    (
        'Age of Empires IV',
        'PC',
        8.5,
        39.99,
        '2021-10-28',
        'activo',
        5
    ),
    (
        'God of War Ragnarök',
        'PlayStation 5',
        9.2,
        69.99,
        '2022-11-09',
        'activo',
        1
    ),
    (
        'Hogwarts Legacy',
        'Xbox Series X',
        8.6,
        49.99,
        '2023-02-10',
        'activo',
        2
    ),
    (
        'Persona 5 Royal',
        'Nintendo Switch',
        9.0,
        59.99,
        '2022-10-21',
        'activo',
        3
    ),
    (
        'FIFA 23',
        'PlayStation 4',
        7.9,
        44.99,
        '2022-09-30',
        'inactivo',
        4
    ),
    (
        'Civilization VI',
        'PC',
        8.7,
        34.99,
        '2016-10-21',
        'activo',
        5
    );