-- Insercion de datos para ranking battle royale (ejercicio-032)
USE campuslands_mysql;

-- Insercion en jugadores_br
INSERT INTO jugadores_br (nickname, pais, nivel, estado) VALUES
('AlphaHunter', 'Guatemala', 45, 'Activo'),
('GhostSniper', 'Mexico', 52, 'Activo'),
('ViperQueen', 'Colombia', 38, 'Activo'),
('ShadowKiller', 'Argentina', 60, 'Activo'),
('DeltaStorm', 'Chile', 29, 'Revision'),
('ApexPredator', 'Peru', 58, 'Activo'),
('NovaStrike', 'Ecuador', 33, 'Activo'),
('IronFist', 'Costa Rica', 41, 'Inactivo');

-- Insercion en partidas_br
INSERT INTO partidas_br (id_jugador, mapa, posicion, eliminaciones, puntos, fecha_partida) VALUES
(1, 'Isla Solitaria', 1, 14, 1250.50, '2025-02-10 14:30:00'),
(1, 'Desierto Rojo', 3, 8, 850.00, '2025-02-11 16:00:00'),
(2, 'Isla Solitaria', 1, 18, 1500.00, '2025-02-10 14:30:00'),
(2, 'Canon Helado', 2, 11, 980.25, '2025-02-12 18:20:00'),
(3, 'Desierto Rojo', 1, 12, 1120.00, '2025-02-11 16:00:00'),
(3, 'Isla Solitaria', 5, 6, 620.00, '2025-02-13 20:10:00'),
(4, 'Canon Helado', 1, 21, 1850.00, '2025-02-12 18:20:00'),
(4, 'Desierto Rojo', 2, 15, 1340.00, '2025-02-14 21:00:00'),
(5, 'Isla Solitaria', 12, 3, 310.00, '2025-02-10 14:30:00'),
(6, 'Canon Helado', 1, 16, 1420.00, '2025-02-12 18:20:00'),
(7, 'Desierto Rojo', 4, 9, 790.50, '2025-02-11 16:00:00'),
(8, 'Isla Solitaria', 20, 1, 150.00, '2025-02-10 14:30:00');

