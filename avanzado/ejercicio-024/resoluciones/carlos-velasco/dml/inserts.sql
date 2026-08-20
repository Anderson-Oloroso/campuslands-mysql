-- ============================================================
-- Ejercicio 024 - Datos iniciales
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Soldadores
-- ------------------------------------------------------------
INSERT INTO soldadores (
    nombre,
    especialidad,
    nivel_experiencia,
    estado
)
VALUES
    ('Carlos Mendoza', 'soldadura MIG', 'senior', 'activo'),
    ('Luis Herrera', 'soldadura TIG', 'senior', 'activo'),
    ('Andrea Castillo', 'soldadura MIG', 'intermedio', 'activo'),
    ('Miguel Torres', 'soldadura electrica', 'senior', 'activo'),
    ('Sofia Ramirez', 'soldadura TIG', 'intermedio', 'activo'),
    ('Daniel Morales', 'soldadura MIG', 'junior', 'activo'),
    ('Valeria Gomez', 'soldadura de aluminio', 'senior', 'activo'),
    ('Jorge Perez', 'soldadura electrica', 'intermedio', 'activo'),
    ('Camila Rodriguez', 'soldadura TIG', 'junior', 'activo'),
    ('Fernando Lopez', 'soldadura estructural', 'senior', 'inactivo');


-- ------------------------------------------------------------
-- Trabajos de soldadura
-- ------------------------------------------------------------
INSERT INTO trabajos_soldadura (
    id_soldador,
    cliente,
    tipo_soldadura,
    material,
    fecha_trabajo,
    horas_estimadas,
    costo_estimado,
    estado
)
VALUES
    (1, 'Metalurgica Central', 'MIG', 'acero', '2026-08-01', 8.00, 450.00, 'en_proceso'),
    (2, 'Industrias Norte', 'TIG', 'acero inoxidable', '2026-08-02', 6.50, 520.00, 'pendiente'),
    (3, 'Taller Omega', 'MIG', 'acero', '2026-08-03', 5.00, 280.00, 'finalizado'),
    (4, 'Construcciones Alfa', 'electrica', 'acero estructural', '2026-08-04', 10.00, 750.00, 'en_proceso'),
    (5, 'Motores del Sur', 'TIG', 'aluminio', '2026-08-05', 7.00, 610.00, 'pendiente'),
    (6, 'Taller Industrial GT', 'MIG', 'acero', '2026-08-06', 4.50, 240.00, 'finalizado'),
    (7, 'Aluminio Moderno', 'TIG', 'aluminio', '2026-08-07', 9.00, 820.00, 'en_proceso'),
    (8, 'Estructuras Lopez', 'electrica', 'acero estructural', '2026-08-08', 12.00, 900.00, 'pendiente'),
    (9, 'Precision Metal', 'TIG', 'acero inoxidable', '2026-08-09', 6.00, 480.00, 'finalizado'),
    (1, 'Metalurgica Central', 'MIG', 'acero', '2026-08-10', 7.50, 430.00, 'pendiente'),
    (2, 'Industrias Norte', 'TIG', 'acero inoxidable', '2026-08-11', 8.00, 650.00, 'en_proceso'),
    (4, 'Construcciones Alfa', 'electrica', 'acero estructural', '2026-08-12', 11.00, 850.00, 'pendiente');