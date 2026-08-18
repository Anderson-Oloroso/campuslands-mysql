-- Ejercicio 011 (Intermedio) - CHECK para pingpong
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO partidos_pingpong (jugador_local, jugador_visitante, sets_local, sets_visitante, estado, fecha_partido) VALUES
('Carlos Méndez',  'Ana Ramírez',     3, 1, 'jugado',      '2026-01-10'),
('Luis Torres',    'María Gómez',     3, 2, 'jugado',      '2026-01-17'),
('Sofía Herrera',  'Diego Morales',   3, 0, 'jugado',      '2026-01-24'),
('Pedro Castillo', 'Valeria Cruz',    2, 3, 'jugado',      '2026-02-02'),
('Andrés Pineda',  'Camila Rivas',    5, 4, 'jugado',      '2026-02-09'),
('Carlos Méndez',  'Luis Torres',     0, 0, 'programado',  '2026-06-14'),
('Ana Ramírez',    'Sofía Herrera',   0, 0, 'programado',  '2026-06-21'),
('María Gómez',    'Pedro Castillo',  1, 0, 'suspendido',  '2026-03-05'),
('Diego Morales',  'Andrés Pineda',   3, 3, 'programado',  '2026-06-28'),
('Valeria Cruz',   'Camila Rivas',    2, 1, 'suspendido',  '2026-03-12');
