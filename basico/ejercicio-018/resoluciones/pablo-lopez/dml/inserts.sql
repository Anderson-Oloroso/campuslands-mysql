-- ============================================================
-- EJERCICIO 018 - PRIMARY KEY PARA VIAJES Y TURISMO
-- Archivo: dml/inserts.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- Insertar destinos turísticos
-- ============================================================

INSERT INTO destinos (
    nombre,
    pais,
    continente,
    costo_promedio,
    dias_recomendados,
    estado
)
VALUES
    (
        'Antigua Guatemala',
        'Guatemala',
        'America',
        350.00,
        3,
        'disponible'
    ),
    (
        'Lago de Atitlan',
        'Guatemala',
        'America',
        280.00,
        3,
        'disponible'
    ),
    (
        'Cancun',
        'Mexico',
        'America',
        850.00,
        5,
        'disponible'
    ),
    (
        'Cartagena',
        'Colombia',
        'America',
        720.00,
        4,
        'disponible'
    ),
    (
        'Buenos Aires',
        'Argentina',
        'America',
        950.00,
        6,
        'disponible'
    ),
    (
        'Madrid',
        'España',
        'Europa',
        1200.00,
        7,
        'disponible'
    ),
    (
        'Paris',
        'Francia',
        'Europa',
        1650.00,
        7,
        'disponible'
    ),
    (
        'Roma',
        'Italia',
        'Europa',
        1450.00,
        7,
        'disponible'
    ),
    (
        'Tokio',
        'Japon',
        'Asia',
        2100.00,
        10,
        'disponible'
    ),
    (
        'Seul',
        'Corea del Sur',
        'Asia',
        1950.00,
        9,
        'disponible'
    ),
    (
        'El Cairo',
        'Egipto',
        'Africa',
        1350.00,
        6,
        'disponible'
    ),
    (
        'Santo Domingo',
        'Republica Dominicana',
        'America',
        780.00,
        5,
        'no_disponible'
    );