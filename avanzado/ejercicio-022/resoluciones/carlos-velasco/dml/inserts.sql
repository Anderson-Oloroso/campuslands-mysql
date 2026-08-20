-- ============================================================
-- Ejercicio 022 - Datos iniciales
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Artistas 3D
-- ------------------------------------------------------------
INSERT INTO artistas_3d (
    nombre,
    especialidad,
    experiencia_anios,
    estado
)
VALUES
    ('Sofia Martinez', 'modelado 3D', 7, 'activo'),
    ('Daniel Gomez', 'rigging', 9, 'activo'),
    ('Camila Rodriguez', 'animacion de personajes', 6, 'activo'),
    ('Mateo Lopez', 'texturizado', 8, 'activo'),
    ('Valentina Perez', 'iluminacion 3D', 5, 'activo'),
    ('Andres Castillo', 'modelado 3D', 10, 'activo'),
    ('Laura Hernandez', 'animacion de personajes', 7, 'activo'),
    ('Nicolas Ramirez', 'efectos visuales', 4, 'activo'),
    ('Gabriela Morales', 'texturizado', 3, 'activo'),
    ('Diego Torres', 'rigging', 2, 'inactivo');


-- ------------------------------------------------------------
-- Proyectos 3D
-- ------------------------------------------------------------
INSERT INTO proyectos_3d (
    nombre,
    tipo,
    fecha_inicio,
    fecha_fin,
    presupuesto,
    estado
)
VALUES
    ('Guardianes del Bosque', 'cortometraje', '2026-01-05', NULL, 12000.00, 'en_progreso'),
    ('Ciudad Futurista', 'videojuego', '2026-01-10', NULL, 25000.00, 'en_progreso'),
    ('Viaje Espacial', 'cortometraje', '2026-02-01', '2026-05-20', 15000.00, 'finalizado'),
    ('Heroes del Tiempo', 'videojuego', '2026-02-15', NULL, 30000.00, 'en_progreso'),
    ('Criaturas Marinas', 'animacion', '2026-03-01', NULL, 18000.00, 'planificado'),
    ('Mundo Fantastico', 'cortometraje', '2026-03-15', '2026-06-30', 14000.00, 'finalizado'),
    ('Robot Explorador', 'videojuego', '2026-04-01', NULL, 22000.00, 'en_progreso'),
    ('Aventuras Urbanas', 'animacion', '2026-04-20', NULL, 11000.00, 'planificado'),
    ('Reino de Cristal', 'cortometraje', '2026-05-01', NULL, 16000.00, 'en_progreso'),
    ('Expedicion Lunar', 'videojuego', '2026-06-01', NULL, 28000.00, 'planificado');


-- ------------------------------------------------------------
-- Escenas 3D
-- ------------------------------------------------------------
INSERT INTO escenas (
    id_proyecto,
    id_artista,
    nombre,
    tipo,
    horas_trabajadas,
    complejidad,
    estado
)
VALUES
    (1, 1, 'Bosque Principal', 'escenario', 32.50, 'alta', 'en_progreso'),
    (1, 3, 'Guardian Principal', 'personaje', 24.00, 'alta', 'finalizada'),
    (2, 4, 'Edificio Central', 'escenario', 28.00, 'media', 'en_progreso'),
    (2, 2, 'Rigging Protagonista', 'rigging', 35.50, 'alta', 'pendiente'),
    (3, 6, 'Nave Espacial', 'vehiculo', 40.00, 'alta', 'finalizada'),
    (3, 5, 'Iluminacion Final', 'iluminacion', 18.50, 'media', 'finalizada'),
    (4, 7, 'Heroe Principal', 'personaje', 30.00, 'alta', 'en_progreso'),
    (4, 8, 'Efectos de Energia', 'efectos', 26.50, 'alta', 'pendiente'),
    (5, 9, 'Criatura Marina', 'personaje', 22.00, 'media', 'pendiente'),
    (6, 1, 'Castillo Fantastico', 'escenario', 36.00, 'alta', 'finalizada'),
    (7, 6, 'Robot Explorador', 'personaje', 31.00, 'alta', 'en_progreso'),
    (8, 3, 'Escena Urbana', 'escenario', 20.00, 'media', 'pendiente');