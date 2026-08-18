-- Ejercicio 015 - relaciones simples para biblioteca gamer
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO desarrolladoras_015 (nombre, pais) VALUES
('Estudio Nortel',   'España'),
('Pixel Forge',      'Argentina'),
('Runa Interactive', 'Chile'),
('Bytecraft Games',  'México');

INSERT INTO basico_ejercicio_015 (titulo, genero, desarrolladora_id, horas_jugadas, estado, agregado_en) VALUES
('Sendero de Ceniza',      'rpg',        1, 42.5, 'completado', '2026-01-06 09:00:00'),
('Torre Infinita',         'estrategia', 1, 15.0, 'jugando',    '2026-01-15 10:20:00'),
('Furia Callejera',        'accion',     2, 8.5,  'completado', '2026-02-01 12:00:00'),
('Retro Kick',             'deportes',   2, 5.0,  'pendiente',  '2026-02-10 14:15:00'),
('Jardin de Bits',         'indie',      3, 12.0, 'completado', '2026-02-20 08:40:00'),
('Cronicas del Vacio',     'rpg',        3, 30.0, 'jugando',    '2026-03-03 09:30:00'),
('Escuadron Zeta',         'accion',     4, 0.0,  'pendiente',  '2026-03-14 11:00:00'),
('Colonia 9',              'estrategia', 4, 22.5, 'completado', '2026-03-28 16:00:00'),
('Pixel Runner',           'indie',      2, 3.0,  'pendiente',  '2026-04-05 13:20:00'),
('Vientos de Runa',        'rpg',        3, 18.0, 'jugando',    '2026-04-19 10:10:00');
