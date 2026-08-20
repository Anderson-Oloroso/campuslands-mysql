USE campuslands_mysql;

-- Inserción de 8 equipos profesionales con presupuestos y puntajes realistas para pruebas transaccionales
INSERT INTO equipos_moba_avanzado (nombre_equipo, region, presupuesto, puntos_liga, estado_equipo) VALUES
('Team Liquid', 'América del Norte', 1500000.00, 24, 'clasificado'),
('Cloud9', 'América del Norte', 1200000.00, 18, 'activo'),
('Fnatic', 'Europa', 1100000.00, 21, 'clasificado'),
('G2 Esports', 'Europa', 1800000.00, 27, 'clasificado'),
('T1', 'Corea del Sur', 2500000.00, 30, 'clasificado'),
('Gen.G', 'Corea del Sur', 2000000.00, 24, 'clasificado'),
('PSG Talon', 'Asia-Pacífico', 800000.00, 12, 'activo'),
('Pain Gaming', 'Latinoamérica', 500000.00, 6, 'eliminado');

-- Ejemplo de registro inicial en el historial de traspasos
INSERT INTO historial_traspasos_moba (equipo_origen_id, equipo_destino_id, jugador_fichado, costo_traspaso, fecha_traspaso) VALUES
(8, 1, 'Jojopyun', 150000.00, '2026-08-10 14:30:00');