USE campuslands_mysql;


INSERT INTO artistas (
    nombre,
    pais,
    estado
) VALUES
    ('Luna Vega', 'Colombia', 'activo'),
    ('Neon Pulse', 'Mexico', 'activo'),
    ('Sofia Mar', 'Argentina', 'activo'),
    ('Atlas Norte', 'Chile', 'activo'),
    ('Marea Azul', 'España', 'activo'),
    ('Ritmo Central', 'Colombia', 'activo'),
    ('Nova Beat', 'Mexico', 'activo'),
    ('Ecos del Sur', 'Peru', 'inactivo');


INSERT INTO canciones (
    artista_id,
    titulo,
    genero,
    reproducciones,
    duracion_segundos,
    fecha_lanzamiento,
    estado
) VALUES
    (1, 'Horizonte', 'Pop', 185000, 214, '2025-02-14', 'activa'),
    (1, 'Luces de Ciudad', 'Pop', 142000, 198, '2025-08-21', 'activa'),

    (2, 'Frecuencia', 'Electronica', 225000, 251, '2025-01-18', 'activa'),
    (2, 'Conexion', 'Electronica', 176000, 238, '2025-09-05', 'activa'),

    (3, 'Sin Miedo', 'Pop', 198000, 221, '2024-11-10', 'activa'),
    (3, 'Otra Vez', 'Balada', 95000, 245, '2025-06-12', 'activa'),

    (4, 'Kilometros', 'Rock', 167000, 267, '2024-07-19', 'activa'),
    (4, 'Ruta Norte', 'Rock', 121000, 284, '2025-03-27', 'activa'),

    (5, 'Marea', 'Balada', 88000, 232, '2025-04-11', 'activa'),
    (6, 'Pulso', 'Urbano', 241000, 203, '2025-05-16', 'activa'),
    (7, 'Orbitas', 'Electronica', 193000, 259, '2025-07-22', 'activa'),
    (8, 'Recuerdo', 'Balada', 42000, 226, '2023-10-03', 'inactiva');