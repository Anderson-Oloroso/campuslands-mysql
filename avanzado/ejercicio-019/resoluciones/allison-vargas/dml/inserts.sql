-- DML: Registro de paracaidistas e inserción de saltos para disparar triggers
USE campuslands_mysql;

-- Inserción de 8 paracaidistas
INSERT INTO paracaidistas (nombre, licencia, total_saltos, horas_caida_libre) VALUES
('Carlos Mendoza', 'A', 12, 0.20),
('Valeria Gómez', 'B', 45, 0.75),
('Mateo Fernández', 'C', 120, 2.10),
('Sofia López', 'A', 5, 0.08),
('Lucía Gómez', 'D', 350, 6.50),
('Andrea Torres', 'B', 60, 1.00),
('Diego Arriola', 'A', 2, 0.03),
('Gabriel Estrada', 'C', 180, 3.20);

-- Inserción de saltos (Dispara tg_validar_altura_salto y tg_actualizar_estadisticas_paracaidista)
INSERT INTO saltos_paracaidismo (paracaidista_id, modalidad, altura_pies, tiempo_caida_sec, fecha_salto) VALUES
(1, 'solo', 10000, 45, '2026-07-01 09:00:00'),
(1, 'solo', 12000, 60, '2026-07-02 10:30:00'),
(2, 'freefly', 13000, 60, '2026-07-05 11:15:00'),
(3, 'formación', 14000, 65, '2026-07-08 12:00:00'),
(4, 'solo', 9000, 40, '2026-07-10 14:00:00'),
(5, 'wing suit', 15000, 120, '2026-07-15 15:30:00'),
(6, 'freefly', 12500, 55, '2026-07-18 16:45:00'),
(8, 'formación', 13500, 60, '2026-07-20 17:00:00');

-- Actualización de licencias (Dispara tg_auditar_cambio_licencia)
UPDATE paracaidistas SET licencia = 'B' WHERE paracaidista_id = 1;
UPDATE paracaidistas SET licencia = 'C' WHERE paracaidista_id = 2;
