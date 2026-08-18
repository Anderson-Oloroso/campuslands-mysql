-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO tipos_soldadura (proceso_siglas, nombre_proceso, descripcion) VALUES
('SMAW', 'Shielded Metal Arc Welding', 'Soldadura por arco con electrodo revestido'),
('GMAW', 'Gas Metal Arc Welding', 'Soldadura MIG/MAG con gas de protección'),
('GTAW', 'Gas Tungsten Arc Welding', 'Soldadura TIG con electrodo de tungsteno');

INSERT INTO soldadores (nombre_soldador, codigo_certificacion, nivel_experiencia, fecha_certificacion) VALUES
('Carlos Arriola', 'AWS-C-8812', 'Avanzado', '2024-03-15'),
('Mario Estrada', 'AWS-C-9041', 'Master', '2022-08-20'),
('Jose Antonio Morales', 'AWS-C-1052', 'Intermedio', '2025-01-10');

INSERT INTO proyectos_estrucutras (nombre_proyecto, cliente, ubicacion, fecha_inicio) VALUES
('Puente Vehicular Norte', 'Ministerio de Comunicaciones', 'Escuintla', '2026-02-01'),
('Nave Industrial Metálica', 'Corporación Logística GT', 'Zona 12, Guatemala', '2026-04-15');

INSERT INTO inspecciones_soldadura (proyecto_id, soldador_id, tipo_id, fecha_inspeccion, longitud_junta_cm, resultado_inspeccion, costo_inspeccion_usd) VALUES
(1, 1, 1, '2026-05-10 08:30:00', 120.50, 'Aprobado', 150.00),
(1, 2, 3, '2026-05-12 11:00:00', 85.00, 'Aprobado', 200.00),
(2, 3, 2, '2026-06-01 09:15:00', 210.00, 'Requiere Reproceso', 180.00),
(2, 1, 2, '2026-06-05 14:20:00', 190.00, 'Aprobado', 180.00),
(1, 3, 1, '2026-06-20 10:00:00', 60.00, 'Rechazado', 120.00);