use soldadura_bloqueos_db;

insert into soldadores (nombre_completo, certificacion, correo, nivel) values
('Angela Arrivillaga', 'AWS D1.1 Structural Welding', 'angela.arrivillaga@campus.weld.com', 'senior'),
('Jinx Chaosmaker', 'ASME Section IX Pressure Vessel', 'jinx.chaos@campus.weld.com', 'master_inspector'),
('Cyber Valka', 'GTAW High Purity Piping', 'valka.cyber@campus.weld.com', 'senior'),
('Ghibli Dreamer', 'GMAW Automotive & Sheet Metal', 'ghibli.dream@campus.weld.com', 'junior'),
('Neon Brush', 'SMAW Shielded Metal Arc', 'neon.brush@campus.weld.com', 'aprendiz'),
('Hollow Knight Fan', 'FCAW Flux Cored Heavy Steel', 'hollow.knight@campus.weld.com', 'senior');

insert into equipos_soldadura (nombre_equipo, proceso_soldadura, amperaje_maximo, estado_equipo) values
('Miller Dynasty 400 TIG', 'GTAW', 400, 'disponible'),
('Lincoln Electric Power MIG 350MP', 'GMAW', 350, 'en_uso'),
('Hypertherm Powermax 85 Plasma/Oxy', 'Oxyfuel', 85, 'disponible'),
('Hobart Champion Elite 225', 'SMAW', 225, 'mantenimiento'),
('ESAB Rogue ES 300i', 'SMAW', 300, 'disponible'),
('Miller XMT 350 FieldPro', 'FCAW', 350, 'en_uso');

insert into juntas_soldadas (id_soldador, id_equipo, codigo_junta, material_base, espesor_mm, resultado_inspeccion, fecha_proceso) values
(1, 1, 'JTN-CYBER-001', 'Acero Inoxidable 316L', 12.50, 'aprobado_radiografia', '2026-07-01 08:30:00'),
(2, 2, 'JTN-ZAUN-002', 'Acero al Carbono A36', 25.00, 'aprobado_radiografia', '2026-07-05 10:15:00'),
(3, 1, 'JTN-PIPE-003', 'Aleación de Titanio Grado 2', 8.00, 'aprobado_radiografia', '2026-07-10 14:00:00'),
(4, 3, 'JTN-SHEET-004', 'Aluminio 6061-T6', 4.50, 'retrabajo', '2026-07-12 09:45:00'),
(5, 5, 'JTN-STRUCT-005', 'Acero Estructural A572', 18.00, 'pendiente', '2026-07-15 11:30:00'),
(1, 6, 'JTN-HEAVY-006', 'Acero Inoxidable Duplex', 32.00, 'aprobado_radiografia', '2026-07-20 15:20:00'),
(6, 2, 'JTN-TOWER-007', 'Acero al Carbono API 5L', 19.50, 'aprobado_radiografia', '2026-07-25 16:00:00'),
(3, 1, 'JTN-MICRO-008', 'Inconel 718', 6.20, 'pendiente', '2026-08-01 09:00:00'),
(2, 6, 'JTN-VESSEL-009', 'Acero SA-516 Gr. 70', 45.00, 'rechazado', '2026-08-05 13:30:00'),
(1, 5, 'JTN-TEST-010', 'Acero Galvanizado', 10.00, 'aprobado_radiografia', '2026-08-10 11:00:00');

insert into consumibles (nombre_consumible, tipo_consumible, stock_kg) values
('Electrodo E7018 1/8"', 'electrodo_revestido', 250.00),
('Alambre ER70S-6 0.035"', 'alambre_mig', 180.50),
('Varilla TIG ER316L 3/32"', 'varilla_tig', 95.00),
('Gas Argón Puro 99.99%', 'gas_proteccion', 500.00),
('Gas Mezcla Ar/CO2 (75/25)', 'gas_proteccion', 420.00),
('Electrodo E6010 Celulósico', 'electrodo_revestido', 150.00);

insert into juntas_consumibles (id_junta, id_consumible, consumo_kg) values
(1, 3, 1.20), (1, 4, 3.50),
(2, 2, 4.80), (2, 5, 6.00),
(3, 3, 0.85), (3, 4, 2.50),
(4, 2, 1.10), (4, 5, 2.00),
(5, 1, 3.20),
(6, 2, 7.50), (6, 5, 10.00),
(7, 1, 5.00), (7, 6, 2.50),
(8, 3, 0.90), (8, 4, 3.00),
(9, 2, 12.00), (9, 5, 15.00),
(10, 1, 2.10);