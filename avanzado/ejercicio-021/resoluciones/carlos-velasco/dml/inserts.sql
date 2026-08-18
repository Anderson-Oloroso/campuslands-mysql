-- ============================================================
-- Ejercicio 021 - Datos iniciales
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Artistas
-- ------------------------------------------------------------
INSERT INTO artistas (
    nombre,
    especialidad,
    experiencia_anios,
    estado
)
VALUES
    ('Sofia Martinez', 'ilustracion digital', 6, 'activo'),
    ('Daniel Gomez', 'concept art', 8, 'activo'),
    ('Camila Rodriguez', 'character design', 5, 'activo'),
    ('Mateo Lopez', 'ilustracion digital', 10, 'activo'),
    ('Valentina Perez', 'pixel art', 4, 'activo'),
    ('Andres Castillo', 'concept art', 7, 'activo'),
    ('Laura Hernandez', 'arte editorial', 9, 'activo'),
    ('Nicolas Ramirez', 'character design', 3, 'activo'),
    ('Gabriela Morales', 'arte editorial', 5, 'activo'),
    ('Diego Torres', 'pixel art', 2, 'inactivo');


-- ------------------------------------------------------------
-- Obras
-- ------------------------------------------------------------
INSERT INTO obras (
    id_artista,
    titulo,
    tecnica,
    fecha_creacion,
    precio,
    estado
)
VALUES
    (1, 'Ciudad Neon', 'ilustracion digital', '2026-01-15', 450.00, 'publicada'),
    (2, 'Guardian del Bosque', 'concept art', '2026-01-20', 800.00, 'vendida'),
    (3, 'Exploradora Espacial', 'character design', '2026-02-05', 600.00, 'publicada'),
    (4, 'Retrato Urbano', 'ilustracion digital', '2026-02-18', 500.00, 'vendida'),
    (5, 'Aventura Pixel', 'pixel art', '2026-03-02', 250.00, 'publicada'),
    (6, 'Ciudad del Futuro', 'concept art', '2026-03-15', 950.00, 'publicada'),
    (7, 'Portada Fantasia', 'arte editorial', '2026-04-01', 700.00, 'vendida'),
    (8, 'Heroe Digital', 'character design', '2026-04-12', 550.00, 'borrador'),
    (1, 'Noche Tropical', 'ilustracion digital', '2026-05-03', 480.00, 'publicada'),
    (3, 'Robot Aventurero', 'character design', '2026-05-15', 620.00, 'publicada'),
    (4, 'Retrato Nocturno', 'ilustracion digital', '2026-06-01', 520.00, 'borrador'),
    (6, 'Templo Perdido', 'concept art', '2026-06-18', 1100.00, 'vendida');


-- ------------------------------------------------------------
-- Proyectos
-- ------------------------------------------------------------
INSERT INTO proyectos (
    id_artista,
    nombre,
    tipo,
    fecha_inicio,
    fecha_fin,
    presupuesto,
    estado
)
VALUES
    (1, 'Coleccion Ciudades', 'coleccion', '2026-01-05', NULL, 2500.00, 'en_progreso'),
    (2, 'Videojuego Fantasia', 'videojuego', '2026-01-10', NULL, 6000.00, 'en_progreso'),
    (3, 'Personajes Espaciales', 'concept art', '2026-02-01', '2026-04-15', 3200.00, 'finalizado'),
    (4, 'Retratos Urbanos', 'coleccion', '2026-02-10', NULL, 2800.00, 'en_progreso'),
    (5, 'Mundo Pixel', 'videojuego', '2026-03-01', NULL, 4500.00, 'planificado'),
    (6, 'Escenarios Futuristas', 'videojuego', '2026-03-12', NULL, 7200.00, 'en_progreso'),
    (7, 'Revista Fantasia', 'editorial', '2026-04-01', '2026-06-30', 3800.00, 'finalizado'),
    (8, 'Heroes Digitales', 'concept art', '2026-04-10', NULL, 3000.00, 'planificado'),
    (9, 'Coleccion Editorial', 'editorial', '2026-05-01', NULL, 4200.00, 'en_progreso'),
    (1, 'Naturaleza Digital', 'coleccion', '2026-06-01', NULL, 2700.00, 'planificado');