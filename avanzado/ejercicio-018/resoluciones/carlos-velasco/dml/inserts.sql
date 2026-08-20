-- ============================================================
-- Ejercicio 018 - Datos iniciales
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Destinos
-- ------------------------------------------------------------
INSERT INTO destinos (
    nombre,
    pais,
    categoria,
    estado
)
VALUES
    ('Cartagena de Indias', 'Colombia', 'playa', 'activo'),
    ('San Andres', 'Colombia', 'playa', 'activo'),
    ('Ciudad de Guatemala', 'Guatemala', 'ciudad', 'activo'),
    ('Antigua Guatemala', 'Guatemala', 'cultura', 'activo'),
    ('Cusco', 'Peru', 'cultura', 'activo'),
    ('Patagonia', 'Argentina', 'aventura', 'activo'),
    ('Bariloche', 'Argentina', 'montana', 'activo'),
    ('Ciudad de Mexico', 'Mexico', 'ciudad', 'activo'),
    ('Cancun', 'Mexico', 'playa', 'activo'),
    ('Machu Picchu', 'Peru', 'aventura', 'inactivo');


-- ------------------------------------------------------------
-- Viajes
-- ------------------------------------------------------------
INSERT INTO viajes (
    id_destino,
    nombre,
    fecha_salida,
    fecha_regreso,
    precio,
    cupos,
    estado
)
VALUES
    (1, 'Escapada a Cartagena', '2026-09-05', '2026-09-09', 850.00, 18, 'disponible'),
    (2, 'Caribe en San Andres', '2026-09-12', '2026-09-17', 1100.00, 12, 'disponible'),
    (3, 'Descubre Ciudad de Guatemala', '2026-09-20', '2026-09-23', 620.00, 20, 'disponible'),
    (4, 'Ruta Cultural por Antigua', '2026-10-03', '2026-10-06', 540.00, 15, 'disponible'),
    (5, 'Aventura en Cusco', '2026-10-10', '2026-10-16', 1250.00, 10, 'disponible'),
    (6, 'Patagonia Extrema', '2026-10-18', '2026-10-27', 1800.00, 6, 'disponible'),
    (7, 'Montanas de Bariloche', '2026-11-01', '2026-11-07', 1350.00, 8, 'disponible'),
    (8, 'Experiencia Ciudad de Mexico', '2026-11-10', '2026-11-14', 780.00, 14, 'agotado'),
    (9, 'Todo Cancun', '2026-11-20', '2026-11-25', 1450.00, 5, 'disponible'),
    (10, 'Exploracion de Machu Picchu', '2026-12-01', '2026-12-08', 1600.00, 0, 'cancelado');


-- ------------------------------------------------------------
-- Reservas
-- ------------------------------------------------------------
INSERT INTO reservas (
    id_viaje,
    cliente,
    cantidad_personas,
    fecha_reserva,
    estado
)
VALUES
    (1, 'Laura Martinez', 2, '2026-08-01', 'confirmada'),
    (1, 'Andres Lopez', 1, '2026-08-03', 'confirmada'),
    (2, 'Camila Rodriguez', 3, '2026-08-04', 'confirmada'),
    (3, 'Daniel Gomez', 2, '2026-08-05', 'pendiente'),
    (4, 'Sofia Hernandez', 4, '2026-08-06', 'confirmada'),
    (5, 'Mateo Castillo', 2, '2026-08-07', 'confirmada'),
    (6, 'Valentina Perez', 2, '2026-08-08', 'confirmada'),
    (7, 'Nicolas Ramirez', 1, '2026-08-09', 'pendiente'),
    (8, 'Gabriela Morales', 2, '2026-08-10', 'confirmada'),
    (9, 'Diego Herrera', 3, '2026-08-11', 'cancelada');