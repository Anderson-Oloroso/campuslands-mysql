-- Ejercicio 015 (Intermedio) - carga de datos para biblioteca gamer
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

-- Carga masiva inicial de la coleccion (15 registros)
INSERT INTO coleccion_juegos (titulo, plataforma, horas_jugadas, completado, fecha_adquisicion) VALUES
('Sendero de Ceniza',      'pc',         42.5, 'si', '2026-01-06'),
('Torre Infinita',         'pc',         15.0, 'no', '2026-01-15'),
('Furia Callejera',        'playstation', 8.5, 'si', '2026-02-01'),
('Retro Kick',             'playstation', 5.0, 'no', '2026-02-10'),
('Jardin de Bits',         'switch',     12.0, 'si', '2026-02-20'),
('Cronicas del Vacio',     'xbox',       30.0, 'no', '2026-03-03'),
('Escuadron Zeta',         'xbox',        0.0, 'no', '2026-03-14'),
('Colonia 9',              'pc',         22.5, 'si', '2026-03-28'),
('Pixel Runner',           'switch',      3.0, 'no', '2026-04-05'),
('Vientos de Runa',        'playstation', 18.0, 'no', '2026-04-19'),
('Fortaleza de Hielo',     'pc',         35.0, 'si', '2026-04-26'),
('Ultimo Refugio',         'xbox',       27.5, 'si', '2026-05-03'),
('Carrera Nocturna',       'switch',      9.5, 'no', '2026-05-10'),
('Legado Perdido',         'playstation', 40.0, 'si', '2026-05-17'),
('Reino Fragmentado',      'pc',         14.0, 'no', '2026-05-24');

-- Carga derivada: resumen de completados por plataforma (INSERT ... SELECT)
INSERT INTO resumen_completados_gamer (plataforma, total_completados, horas_totales)
SELECT plataforma,
       COUNT(*) AS total_completados,
       SUM(horas_jugadas) AS horas_totales
FROM coleccion_juegos
WHERE completado = 'si'
GROUP BY plataforma;
