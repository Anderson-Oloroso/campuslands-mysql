-- ============================================================
-- EJERCICIO 019 - INSERT PARA PARACAIDISMO
-- Archivo: dml/inserts.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- Insertar saltos de paracaidismo
-- ============================================================

INSERT INTO saltos (
    nombre_paracaidista,
    modalidad,
    altura_salto,
    duracion_caida,
    fecha_salto,
    estado
)
VALUES
    (
        'Carlos Mendoza',
        'Salto Tandem',
        4000,
        55.50,
        '2026-01-12',
        'completado'
    ),
    (
        'Laura Ramirez',
        'Salto Tandem',
        3800,
        52.30,
        '2026-01-18',
        'completado'
    ),
    (
        'Daniel Castillo',
        'Caida Libre',
        4500,
        68.40,
        '2026-02-03',
        'completado'
    ),
    (
        'Sofia Morales',
        'Salto Tandem',
        3500,
        48.70,
        '2026-02-10',
        'completado'
    ),
    (
        'Andres Herrera',
        'Caida Libre',
        5000,
        75.20,
        '2026-02-21',
        'completado'
    ),
    (
        'Valeria Gomez',
        'Formacion',
        4200,
        61.80,
        '2026-03-02',
        'completado'
    ),
    (
        'Miguel Torres',
        'Salto Tandem',
        3900,
        54.60,
        '2026-03-15',
        'completado'
    ),
    (
        'Camila Rojas',
        'Caida Libre',
        4800,
        72.50,
        '2026-04-05',
        'completado'
    ),
    (
        'Javier Ortiz',
        'Formacion',
        4100,
        60.40,
        '2026-04-19',
        'programado'
    ),
    (
        'Natalia Perez',
        'Salto Tandem',
        3600,
        50.10,
        '2026-05-03',
        'programado'
    ),
    (
        'Ricardo Sanchez',
        'Caida Libre',
        4700,
        70.80,
        '2026-05-17',
        'completado'
    ),
    (
        'Mariana Lopez',
        'Salto Tandem',
        3400,
        46.90,
        '2026-06-01',
        'cancelado'
    );