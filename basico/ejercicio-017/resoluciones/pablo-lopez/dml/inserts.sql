-- ============================================================
-- EJERCICIO 017 - TIPOS DE DATOS PARA TIENDA DE ROPA
-- Archivo: dml/inserts.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- Insertar productos
-- ============================================================

INSERT INTO productos (
    nombre,
    categoria,
    talla,
    precio,
    cantidad_stock,
    estado,
    fecha_registro
)
VALUES
    (
        'Camiseta Urbana Negra',
        'Camisetas',
        'M',
        89.90,
        25,
        'disponible',
        '2026-01-05'
    ),
    (
        'Camiseta Urbana Blanca',
        'Camisetas',
        'L',
        89.90,
        18,
        'disponible',
        '2026-01-06'
    ),
    (
        'Sudadera Oversize Gris',
        'Sudaderas',
        'L',
        189.90,
        12,
        'disponible',
        '2026-01-10'
    ),
    (
        'Sudadera Oversize Negra',
        'Sudaderas',
        'M',
        199.90,
        8,
        'disponible',
        '2026-01-12'
    ),
    (
        'Pantalon Cargo Beige',
        'Pantalones',
        'M',
        159.90,
        15,
        'disponible',
        '2026-01-15'
    ),
    (
        'Pantalon Cargo Negro',
        'Pantalones',
        'L',
        169.90,
        10,
        'disponible',
        '2026-01-16'
    ),
    (
        'Chaqueta Denim Azul',
        'Chaquetas',
        'M',
        249.90,
        6,
        'disponible',
        '2026-01-20'
    ),
    (
        'Chaqueta Bomber Negra',
        'Chaquetas',
        'L',
        279.90,
        4,
        'disponible',
        '2026-01-22'
    ),
    (
        'Gorra Urbana Negra',
        'Accesorios',
        'U',
        59.90,
        30,
        'disponible',
        '2026-02-01'
    ),
    (
        'Gorra Urbana Blanca',
        'Accesorios',
        'U',
        59.90,
        0,
        'agotado',
        '2026-02-02'
    ),
    (
        'Tenis Urbanos Blancos',
        'Calzado',
        '42',
        329.90,
        7,
        'disponible',
        '2026-02-05'
    ),
    (
        'Tenis Urbanos Negros',
        'Calzado',
        '41',
        349.90,
        0,
        'agotado',
        '2026-02-07'
    );