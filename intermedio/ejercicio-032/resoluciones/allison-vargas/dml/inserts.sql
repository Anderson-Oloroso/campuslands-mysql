USE battle_royale_left_db;

INSERT INTO clanes_br (nombre_clan, tag_clan, nivel_clan) VALUES
('Apex Predators', 'APEX', 10),
('Shadow Vanguard', 'SHDW', 8),
('Titanium Legion', 'TTN', 9),
('Phantom Syndicate', 'PHNT', 7),
('Ghost Riders', 'GHST', 5); -- Este clan se usará para probar el LEFT JOIN (sin jugadores asignados)

INSERT INTO jugadores_br (id_clan, nombre_jugador, nickname, puntos_ranking, eliminaciones_totales, estado_cuenta) VALUES
(1, 'Carlos Mendoza', 'ApexSniper', 3500, 180, 'Leyenda'),
(1, 'Sofía Torres', 'ValkyrieX', 3100, 155, 'Leyenda'),
(2, 'Mateo Silva', 'GhostRider', 2850, 130, 'Activo'),
(2, 'Lucía Fernández', 'ShadowQueen', 2600, 115, 'Activo'),
(3, 'Alejandro Gómez', 'Titanium99', 2400, 98, 'Activo'),
(3, 'Valentina Ruiz', 'NeonViper', 2150, 85, 'Activo'),
(4, 'Diego Morales', 'StormBringer', 1900, 70, 'Suspendido'),
(4, 'Camila Rojas', 'CyberCat', 2750, 125, 'Activo');
