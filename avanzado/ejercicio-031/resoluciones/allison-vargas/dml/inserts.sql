USE db_esports_moba;

START TRANSACTION;

INSERT INTO equipos (nombre, region, estado) VALUES 
('Alpha Gaming', 'LATAM', 'activo'),
('Beta Esports', 'NA', 'activo'),
('Gamma Knights', 'EU', 'activo'),
('Delta Force', 'KR', 'activo');

INSERT INTO jugadores (equipo_id, alias, rol, kda_promedio) VALUES 
(1, 'Shadow', 'Mid Laner', 4.50),
(1, 'Vortex', 'Jungler', 3.80),
(2, 'Blaze', 'ADC', 5.10),
(2, 'Frost', 'Support', 2.90),
(3, 'Titan', 'Top Laner', 4.20),
(3, 'Spectre', 'Jungler', 3.50),
(4, 'Phoenix', 'Mid Laner', 6.00),
(4, 'Ghost', 'ADC', 4.80);

INSERT INTO partidas (equipo_ganador_id, equipo_perdedor_id, duracion_minutos) VALUES 
(1, 2, 32),
(3, 4, 45),
(1, 3, 28),
(4, 2, 36),
(2, 3, 40);

COMMIT;
