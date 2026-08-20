-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO trabajos_soldadura (proyecto, tipo_soldadura, material, inspector, estado_inspeccion, defectuosa, fecha_inspeccion) VALUES
('Estructura Puente Norte', 'SMAW', 'Acero Estructural', 'Ing. R. Gomez', 'Aprobado', FALSE, '2026-06-10'),
('Tanque de Presion V-1', 'GTAW/TIG', 'Acero Inoxidable', 'Ing. M. Torres', 'Rechazado', TRUE, '2026-06-15'),
('Tubería Oleoducto Tramo 2', 'FCAW', 'Acero al Carbono', 'Ing. R. Gomez', 'Rechazado', TRUE, '2026-06-18'),
('Chasis Carga Pesada', 'GMAW/MIG', 'Aluminio', 'Ing. C. Paiz', 'Pendiente', FALSE, '2026-07-01'),
('Estructura Galpon B', 'SMAW', 'Acero Estructural', 'Ing. M. Torres', 'Aprobado', FALSE, '2026-07-05');