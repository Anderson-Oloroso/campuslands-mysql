-- Ejercicio 012 - modelado de entidad para playlist musical
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO basico_ejercicio_012 (nombre_cancion, artista, genero, duracion_segundos, favorito, agregada_en) VALUES
    ('Noche de Verano',   'Los Solares',      'pop',         198, 'si', '2026-01-10 09:00:00'),
    ('Camino al Sur',     'Vientos del Este', 'rock',        245, 'no', '2026-01-22 11:15:00'),
    ('Azul Profundo',     'Marina Cortés',    'jazz',        312, 'si', '2026-02-05 14:30:00'),
    ('Pulso Digital',     'Neón 88',          'electronica', 227, 'no', '2026-02-18 16:00:00'),
    ('Ritmo de Barrio',   'La Cuadra',        'reggaeton',   189, 'si', '2026-03-02 08:45:00'),
    ('Horizonte',         'Los Solares',      'pop',         210, 'no', '2026-03-14 10:20:00'),
    ('Fuego Lento',       'Marina Cortés',    'jazz',        278, 'no', '2026-04-01 13:00:00'),
    ('Alta Velocidad',    'Neón 88',          'electronica', 195, 'si', '2026-04-19 17:40:00');