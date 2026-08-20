-- Carga inicial de datos para pruebas de triggers y registros de paracaidismo
USE campuslands_mysql;

-- Inserción de Paracaidistas
INSERT INTO paracaidistas (nombre, licencia, total_saltos, minutos_caida_libre, estado) VALUES
('Sebastian "Sky" Morales', 'D', 1200, 1100, 'activo'),
('Valeria Ríos', 'C', 450, 380, 'activo'),
('Andrés Castro', 'B', 85, 70, 'activo'),
('Camila Fuentes', 'A', 28, 22, 'activo'),
('Mateo Hernández', 'A', 5, 3, 'suspendido');

-- Inserción de Equipos / Paracaídas
INSERT INTO equipos (codigo_modelo, tamano_principal_sqft, estado, fecha_ultima_inspeccion) VALUES
('RIG-SABRE2-170', 170, 'operativo', '2026-07-10'),
('RIG-PULSE-190', 190, 'operativo', '2026-08-01'),
('RIG-VELOCITY-103', 103, 'operativo', '2026-06-15'),
('RIG-NAVIGATOR-220', 220, 'mantenimiento', '2026-05-20');

-- Inserción de Saltos (Disparará trg_actualizar_estadisticas_paracaidista)
INSERT INTO saltos (paracaidista_id, equipo_id, altitud_pies, segundos_caida_libre, tipo_salto, fecha_salto) VALUES
(1, 3, 14000, 60, 'Formación', '2026-08-10 09:00:00'),
(2, 1, 12500, 50, 'Solo', '2026-08-10 10:30:00'),
(3, 2, 10000, 45, 'AFF', '2026-08-11 11:15:00'),
(4, 2, 10000, 45, 'Solo', '2026-08-11 14:00:00'),
(1, 3, 18000, 80, 'Formación', '2026-08-12 16:30:00');

-- Actualización de Equipo (Disparará trg_auditar_cambio_estado_equipo)
UPDATE equipos SET estado = 'mantenimiento' WHERE id = 1;
UPDATE equipos SET estado = 'operativo' WHERE id = 4;