USE campuslands_mysql;

INSERT INTO proyectos
    (nombre, estudio, presupuesto, estado)
VALUES
    ('Guardianes del Reino', 'Pixel Dreams Studio', 85000.00, 'produccion'),
    ('Viaje a Neo-Ciudad', 'Future Frame Studio', 120000.00, 'produccion'),
    ('Mundos de Cristal', 'Crystal Motion', 95000.00, 'planificacion'),
    ('La Isla Perdida', 'Blue Render Studio', 70000.00, 'finalizado'),
    ('Robots del Futuro', 'Future Frame Studio', 110000.00, 'produccion'),
    ('Guardianes del Oceano', 'Blue Render Studio', 88000.00, 'finalizado'),
    ('Cronicas del Espacio', 'Galaxy Animation', 150000.00, 'planificacion'),
    ('Ciudad de Sombras', 'Pixel Dreams Studio', 78000.00, 'finalizado');


INSERT INTO animadores
    (nombre, especialidad, experiencia_anios)
VALUES
    ('Laura Mendoza', 'modelado 3D', 5),
    ('Carlos Ramirez', 'animacion de personajes', 7),
    ('Sofia Herrera', 'texturizado', 4),
    ('Daniel Castro', 'iluminacion', 8),
    ('Mariana Lopez', 'rigging', 6),
    ('Andres Molina', 'efectos visuales', 10),
    ('Valentina Perez', 'modelado 3D', 3),
    ('Mateo Garcia', 'animacion de personajes', 9);


INSERT INTO participaciones
    (id_proyecto, id_animador, rol, horas_trabajadas)
VALUES
    (1, 1, 'modelador principal', 120.50),
    (1, 2, 'animador principal', 150.00),
    (2, 2, 'animador principal', 180.00),
    (2, 3, 'artista de texturas', 95.50),
    (3, 1, 'modelador', 100.00),
    (3, 4, 'iluminador', 75.00),
    (4, 5, 'especialista en rigging', 90.00),
    (4, 6, 'efectos visuales', 65.50),
    (5, 6, 'efectos visuales', 140.00),
    (5, 8, 'animador principal', 175.50),
    (6, 3, 'artista de texturas', 110.00),
    (6, 7, 'modelador', 85.00),
    (7, 4, 'iluminador', 125.00),
    (7, 6, 'efectos visuales', 160.00),
    (8, 5, 'especialista en rigging', 100.00),
    (8, 8, 'animador principal', 135.00);