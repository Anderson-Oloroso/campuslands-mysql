USE campuslands_mysql;

INSERT INTO proyectos_animacion
    (nombre, categoria, presupuesto, estado, fecha_inicio)
VALUES
    ('Guardianes del Espacio', 'Ciencia ficcion', 15000.00, 'finalizado', '2026-01-10'),
    ('Aventuras de Niko', 'Aventura', 8500.00, 'en_produccion', '2026-01-18'),
    ('Ciudad Futurista', 'Ciencia ficcion', 18000.00, 'en_produccion', '2026-02-03'),
    ('El Bosque Encantado', 'Fantasia', 12000.00, 'finalizado', '2026-02-14'),
    ('Robots en Accion', 'Tecnologia', 9500.00, 'pausado', '2026-02-27'),
    ('Viaje Submarino', 'Aventura', 14000.00, 'en_produccion', '2026-03-05'),
    ('Dragones del Norte', 'Fantasia', 21000.00, 'finalizado', '2026-03-19'),
    ('Mundo Miniatura', 'Infantil', 6500.00, 'en_produccion', '2026-04-02');

INSERT INTO animadores
    (nombre, especialidad, experiencia_anios)
VALUES
    ('Ana Martinez', 'Modelado 3D', 5),
    ('Carlos Ramirez', 'Rigging', 4),
    ('Laura Gomez', 'Animacion de personajes', 7),
    ('Diego Herrera', 'Texturizado', 3),
    ('Sofia Morales', 'Iluminacion', 6),
    ('Miguel Torres', 'Efectos visuales', 5);

INSERT INTO proyecto_animador
    (proyecto_id, animador_id, rol)
VALUES
    (1, 1, 'Modelador principal'),
    (1, 3, 'Animador principal'),
    (2, 2, 'Especialista en rigging'),
    (2, 4, 'Artista de texturas'),
    (3, 1, 'Modelador principal'),
    (3, 5, 'Artista de iluminacion'),
    (4, 3, 'Animador de personajes'),
    (4, 6, 'Especialista en efectos'),
    (5, 2, 'Especialista en rigging'),
    (6, 4, 'Artista de texturas'),
    (7, 3, 'Animador principal'),
    (8, 5, 'Artista de iluminacion');