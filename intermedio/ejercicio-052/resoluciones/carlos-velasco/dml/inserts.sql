-- ============================================================
-- EJERCICIO 052 - NORMALIZACION 2FN PARA ANIMACION 3D
-- DML
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Proyectos
-- ------------------------------------------------------------

INSERT INTO proyectos_animacion
    (nombre, estudio, fecha_inicio, presupuesto, estado)
VALUES
    ('Guardianes del Render', 'Pixel Forge', '2026-01-15', 85000.00, 'en_produccion'),
    ('Mundos de Neon', 'Vision 3D', '2026-02-10', 62000.00, 'en_produccion'),
    ('Criaturas del Bosque', 'Pixel Forge', '2026-03-05', 47000.00, 'finalizado'),
    ('Ciudad Futurista', 'Nova Animation', '2026-03-20', 73000.00, 'en_produccion');

-- ------------------------------------------------------------
-- Animadores
-- ------------------------------------------------------------

INSERT INTO animadores
    (nombre, especialidad, nivel, estado)
VALUES
    ('Laura Mendoza', 'Modelado 3D', 'senior', 'activo'),
    ('Carlos Ramirez', 'Rigging', 'mid', 'activo'),
    ('Sofia Torres', 'Animacion de personajes', 'senior', 'activo'),
    ('Mateo Vargas', 'Texturizado', 'junior', 'activo'),
    ('Daniela Ruiz', 'Iluminacion', 'mid', 'activo'),
    ('Andres Castro', 'Modelado 3D', 'junior', 'activo');

-- ------------------------------------------------------------
-- Participaciones
-- ------------------------------------------------------------

INSERT INTO proyecto_animador
    (proyecto_id, animador_id, rol, horas_asignadas)
VALUES
    (1, 1, 'Directora de modelado', 120),
    (1, 2, 'Especialista en rigging', 90),
    (1, 3, 'Animadora principal', 140),

    (2, 1, 'Supervisora de modelado', 100),
    (2, 4, 'Artista de texturas', 80),
    (2, 5, 'Artista de iluminacion', 70),

    (3, 3, 'Animadora principal', 110),
    (3, 4, 'Artista de texturas', 65),
    (3, 6, 'Modelador 3D', 75),

    (4, 2, 'Especialista en rigging', 95),
    (4, 5, 'Artista de iluminacion', 85),
    (4, 6, 'Modelador 3D', 100);