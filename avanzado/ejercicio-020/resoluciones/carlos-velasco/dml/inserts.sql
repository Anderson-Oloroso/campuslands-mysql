-- ============================================================
-- Ejercicio 020 - Datos iniciales
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tatuadores
-- ------------------------------------------------------------
INSERT INTO tatuadores (
    nombre,
    especialidad,
    experiencia_anios,
    estado
)
VALUES
    ('Mateo Ramirez', 'realismo', 8, 'activo'),
    ('Sofia Martinez', 'minimalista', 5, 'activo'),
    ('Daniel Gomez', 'blackwork', 10, 'activo'),
    ('Valentina Perez', 'floral', 6, 'activo'),
    ('Andres Castillo', 'geometrico', 7, 'activo'),
    ('Camila Rodriguez', 'realismo', 4, 'activo'),
    ('Nicolas Hernandez', 'japones', 12, 'activo'),
    ('Laura Morales', 'acuarela', 5, 'activo'),
    ('Diego Lopez', 'blackwork', 9, 'activo'),
    ('Gabriela Torres', 'minimalista', 3, 'inactivo');


-- ------------------------------------------------------------
-- Clientes
-- ------------------------------------------------------------
INSERT INTO clientes (
    nombre,
    telefono,
    email,
    estado
)
VALUES
    ('Carlos Velasco', '55510001', 'carlos@example.com', 'activo'),
    ('Laura Herrera', '55510002', 'laura@example.com', 'activo'),
    ('Andres Lopez', '55510003', 'andres@example.com', 'activo'),
    ('Camila Gomez', '55510004', 'camila@example.com', 'activo'),
    ('Sofia Rodriguez', '55510005', 'sofia@example.com', 'activo'),
    ('Mateo Perez', '55510006', 'mateo@example.com', 'activo'),
    ('Valentina Morales', '55510007', 'valentina@example.com', 'activo'),
    ('Daniel Castillo', '55510008', 'daniel@example.com', 'activo'),
    ('Nicolas Ramirez', '55510009', 'nicolas@example.com', 'activo'),
    ('Gabriela Hernandez', '55510010', 'gabriela@example.com', 'inactivo');


-- ------------------------------------------------------------
-- Citas
-- ------------------------------------------------------------
INSERT INTO citas (
    id_cliente,
    id_tatuador,
    fecha_cita,
    estilo,
    tamano_cm,
    precio,
    estado
)
VALUES
    (1, 1, '2026-08-20 09:00:00', 'realismo', 18.50, 450.00, 'programada'),
    (2, 2, '2026-08-20 11:00:00', 'minimalista', 6.00, 180.00, 'realizada'),
    (3, 3, '2026-08-21 14:00:00', 'blackwork', 15.00, 380.00, 'programada'),
    (4, 4, '2026-08-21 16:00:00', 'floral', 12.00, 300.00, 'realizada'),
    (5, 5, '2026-08-22 10:00:00', 'geometrico', 14.00, 350.00, 'programada'),
    (6, 6, '2026-08-22 13:30:00', 'realismo', 20.00, 500.00, 'realizada'),
    (7, 7, '2026-08-23 09:30:00', 'japones', 25.00, 650.00, 'programada'),
    (8, 8, '2026-08-23 15:00:00', 'acuarela', 10.00, 280.00, 'cancelada'),
    (9, 9, '2026-08-24 11:30:00', 'blackwork', 16.00, 400.00, 'realizada'),
    (1, 2, '2026-08-25 10:00:00', 'minimalista', 8.00, 220.00, 'programada'),
    (2, 1, '2026-08-25 14:30:00', 'realismo', 22.00, 550.00, 'programada'),
    (3, 3, '2026-08-26 16:00:00', 'blackwork', 10.00, 290.00, 'cancelada');