-- ============================================================
-- EJERCICIO 016 - CREATE TABLE PARA RESTAURANTE DE COMIDA URBANA
-- Archivo: dml/inserts.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- Inserción de productos
-- ============================================================

INSERT INTO productos (
    nombre,
    categoria,
    precio,
    estado,
    fecha_alta
)
VALUES
    (
        'Hamburguesa Clásica',
        'Hamburguesas',
        28.00,
        'disponible',
        '2026-01-10'
    ),
    (
        'Hamburguesa BBQ',
        'Hamburguesas',
        34.50,
        'disponible',
        '2026-01-12'
    ),
    (
        'Hamburguesa Doble',
        'Hamburguesas',
        42.00,
        'disponible',
        '2026-01-15'
    ),
    (
        'Hot Dog Especial',
        'Hot Dogs',
        22.00,
        'disponible',
        '2026-01-20'
    ),
    (
        'Hot Dog BBQ',
        'Hot Dogs',
        25.50,
        'no_disponible',
        '2026-01-22'
    ),
    (
        'Papas Clásicas',
        'Acompañamientos',
        15.00,
        'disponible',
        '2026-02-01'
    ),
    (
        'Papas con Queso',
        'Acompañamientos',
        21.00,
        'disponible',
        '2026-02-03'
    ),
    (
        'Nachos Urbanos',
        'Acompañamientos',
        24.50,
        'disponible',
        '2026-02-05'
    ),
    (
        'Limonada Natural',
        'Bebidas',
        12.00,
        'disponible',
        '2026-02-10'
    ),
    (
        'Limonada Fresa',
        'Bebidas',
        16.00,
        'disponible',
        '2026-02-12'
    ),
    (
        'Batido de Chocolate',
        'Bebidas',
        20.00,
        'no_disponible',
        '2026-02-15'
    ),
    (
        'Brownie con Helado',
        'Postres',
        27.50,
        'disponible',
        '2026-02-20'
    );