-- Ejercicio 012 (Intermedio) - consultas de reportes para playlist musical
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO reproducciones_playlist (nombre_cancion, artista, genero, duracion_segundos, reproducciones, agregada_en) VALUES
('Noche de Verano',   'Los Solares',      'pop',         198, 15200, '2026-01-10'),
('Horizonte',         'Los Solares',      'pop',         210, 8900,  '2026-01-22'),
('Camino al Sur',     'Vientos del Este', 'rock',        245, 6400,  '2026-02-02'),
('Azul Profundo',     'Marina Cortés',    'jazz',        312, 2100,  '2026-02-08'),
('Fuego Lento',       'Marina Cortés',    'jazz',        278, 1800,  '2026-02-15'),
('Pulso Digital',     'Neón 88',          'electronica', 227, 12300, '2026-02-20'),
('Alta Velocidad',    'Neón 88',          'electronica', 195, 9800,  '2026-03-01'),
('Ritmo de Barrio',   'La Cuadra',        'reggaeton',   189, 21000, '2026-03-10'),
('Calle Nueva',       'La Cuadra',        'reggaeton',   192, 17500, '2026-03-18'),
('Silencio de Sala',  'Marina Cortés',    'jazz',        330, 500,   '2026-04-02');
