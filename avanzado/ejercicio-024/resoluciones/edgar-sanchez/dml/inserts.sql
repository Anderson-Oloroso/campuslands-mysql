INSERT INTO soldadores (nombre_soldador, certificacion_codigo, especialidad, experiencia_anos) VALUES
('Jorge Estrada', 'AWS-CERT-6G-01', 'TIG / GTAW', 8),
('Mario Reyes', 'AWS-CERT-3G-02', 'MIG / GMAW', 5),
('Carlos Fuentes', 'AWS-CERT-4G-03', 'Electrodo / SMAW', 12);

INSERT INTO equipos_soldar (codigo_inventario, tipo_proceso, marca_modelo, amperaje_maximo, estado_equipo) VALUES
('EQ-MILLER-250', 'GTAW', 'Miller Dynasty 280', 280, 'Disponible'),
('EQ-LINCOLN-300', 'GMAW', 'Lincoln Power Wave C300', 300, 'Disponible'),
('EQ-ESAB-200', 'SMAW', 'ESAB Rogue ES 200i', 200, 'Disponible');

INSERT INTO proyectos_soldadura (soldador_id, equipo_id, nombre_proyecto, tipo_estructura, fecha_inicio, estado_proyecto) VALUES
(1, 1, 'Tubería de Alta Presión Oleoducto', 'Tubería Industrial', '2026-08-01', 'En Progreso'),
(2, 2, 'Estructura Metálica Puente Sur', 'Vigas I / Puente', '2026-08-05', 'En Progreso'),
(3, 3, 'Tanque de Almacenamiento Acero Inox', 'Depósito Industrial', '2026-08-10', 'En Inspección');

INSERT INTO inspecciones_soldadura (proyecto_id, tipo_ensayo, inspector_responsable, resultado, fecha_inspeccion) VALUES
(1, 'Ultrasonido', 'Ing. Roberto Méndez', 'Aprobado', '2026-08-12 10:00:00'),
(2, 'Visual', 'Ing. Roberto Méndez', 'Con Observaciones', '2026-08-14 15:30:00'),
(3, 'Líquidos Penetrantes', 'Ing. Ana Lucía Paiz', 'Aprobado', '2026-08-16 09:00:00');