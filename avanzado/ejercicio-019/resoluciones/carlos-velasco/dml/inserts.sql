-- ============================================================
-- Ejercicio 019 - Datos iniciales
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Paracaidistas
-- ------------------------------------------------------------
INSERT INTO paracaidistas (
    nombre,
    nivel_experiencia,
    saltos_realizados,
    estado
)
VALUES
    ('Laura Martinez', 'avanzado', 25, 'activo'),
    ('Andres Lopez', 'intermedio', 12, 'activo'),
    ('Camila Rodriguez', 'principiante', 3, 'activo'),
    ('Daniel Gomez', 'avanzado', 40, 'activo'),
    ('Sofia Hernandez', 'intermedio', 18, 'activo'),
    ('Mateo Castillo', 'avanzado', 31, 'activo'),
    ('Valentina Perez', 'principiante', 2, 'activo'),
    ('Nicolas Ramirez', 'intermedio', 15, 'activo'),
    ('Gabriela Morales', 'avanzado', 52, 'activo'),
    ('Diego Herrera', 'principiante', 1, 'inactivo');


-- ------------------------------------------------------------
-- Equipos
-- ------------------------------------------------------------
INSERT INTO equipos (
    codigo,
    tipo,
    marca,
    disponibilidad,
    estado
)
VALUES
    ('PAR-001', 'paracaidas deportivo', 'SkyPro', 5, 'disponible'),
    ('PAR-002', 'paracaidas deportivo', 'SkyPro', 4, 'disponible'),
    ('PAR-003', 'paracaidas tándem', 'AeroSafe', 3, 'disponible'),
    ('PAR-004', 'paracaidas tándem', 'AeroSafe', 2, 'disponible'),
    ('PAR-005', 'paracaidas reserva', 'FreeFall', 5, 'disponible'),
    ('PAR-006', 'paracaidas deportivo', 'FreeFall', 4, 'disponible'),
    ('PAR-007', 'paracaidas tándem', 'SkyPro', 2, 'disponible'),
    ('PAR-008', 'paracaidas reserva', 'AeroSafe', 3, 'disponible'),
    ('PAR-009', 'paracaidas deportivo', 'SkyPro', 1, 'disponible'),
    ('PAR-010', 'paracaidas deportivo', 'FreeFall', 0, 'mantenimiento');


-- ------------------------------------------------------------
-- Saltos
-- ------------------------------------------------------------
INSERT INTO saltos (
    id_paracaidista,
    id_equipo,
    fecha_salto,
    altura_metros,
    duracion_segundos,
    estado
)
VALUES
    (1, 1, '2026-08-01 09:00:00', 4000, 240, 'realizado'),
    (2, 2, '2026-08-02 10:30:00', 3500, 210, 'realizado'),
    (3, 3, '2026-08-03 11:00:00', 3000, 180, 'realizado'),
    (4, 4, '2026-08-04 09:45:00', 4500, 270, 'realizado'),
    (5, 5, '2026-08-05 14:00:00', 4000, 230, 'realizado'),
    (6, 6, '2026-08-06 10:15:00', 5000, 300, 'realizado'),
    (7, 7, '2026-08-07 15:30:00', 3000, 190, 'programado'),
    (8, 8, '2026-08-08 08:30:00', 3500, 215, 'programado');