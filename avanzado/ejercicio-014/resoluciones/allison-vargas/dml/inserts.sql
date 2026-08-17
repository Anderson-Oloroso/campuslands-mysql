-- DML: Registro inicial de naves de la saga galáctica
USE campuslands_mysql;

INSERT INTO naves_espaciales (nombre, modelo, nivel_energia, estado_mision, horas_vuelo, ultima_revision) VALUES
('Halcón Milenario', 'YT-1300 Carguero', 45.50, 'en_orbita', 6200, '2026-06-01 10:00:00'),
('Enterprise NCC-1701', 'Clase Constitución', 92.00, 'en_orbita', 4800, '2026-07-01 08:30:00'),
('Caza X-Wing', 'T-65B Ala-X', 15.00, 'mantenimiento', 1200, '2026-07-20 14:15:00'),
('Nostromo', 'Lockheed CM-88B', 30.00, 'hiperespacio', 8500, '2026-05-15 12:00:00'),
('Razor Crest', 'ST-70 Cañonera', 80.00, 'en_orbita', 3100, '2026-06-28 16:45:00'),
('Destructor Estelar', 'Clase Imperial I', 60.00, 'mantenimiento', 7400, '2026-07-10 11:20:00'),
('Caza TIE Interceptor', 'TIE/IN', 10.00, 'inactiva', 950, '2026-04-11 09:00:00'),
('Discovery One', 'USSC Discovery', 88.00, 'hiperespacio', 5200, '2026-07-18 19:30:00');
