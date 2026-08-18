-- Datos de practica. Puedes cambiarlos o agregar mas filas.
-- Insertar Áreas (6 registros)
INSERT INTO areas (nombre, ubicacion) VALUES
('Taller Mecánico A', 'Nave Industrial 1'),
('Nave de Estructuras Pesadas', 'Nave Industrial 2'),
('Laboratorio de Ensayos', 'Edificio Técnico Fl-1'),
('Área de Robótica y Automatización', 'Nave Industrial 3'),
('Zona de Tuberías e Inox', 'Planta Baja Sector B'),
('Taller de Formación Técnica', 'Centro de Capacitación');

-- Insertar Tipos de Bloqueo (6 registros)
INSERT INTO tipos_bloqueo (codigo_bloqueo, tipo, descripcion) VALUES
('LOTO-ELE', 'Eléctrico', 'Bloqueo de disyuntor o interruptor principal de energía.'),
('LOTO-GAS', 'Neumático/Gas', 'Bloqueo de válvula de suministro de gas protector (Argón/CO2).'),
('LOTO-MEC', 'Mecánico', 'Traba física en partes móviles de manipuladores o posicionadores.'),
('LOTO-MNT', 'Mantenimiento Preventivo', 'Inmovilización del equipo para inspección programada.'),
('LOTO-CAL', 'Fallo de Calibración', 'Interrupción de uso por parámetros fuera de tolerancia.'),
('LOTO-SEG', 'Emergencia de Seguridad', 'Parada inmediata por falla en la protección contra arco o fugas.');

-- Insertar Equipos de Soldadura (6 registros)
INSERT INTO equipos (codigo_equipo, modelo, id_area, estado) VALUES
('EQ-MIG-01', 'Miller Continuum 500 (MIG/MAG)', 1, 'Bloqueado'),
('EQ-TIG-02', 'Lincoln Aspect 375 (TIG)', 5, 'Disponible'),
('EQ-SMAW-03', 'Esab Warrior 500i (Electrodo)', 2, 'Disponible'),
('EQ-ROB-04', 'ABB FlexArc Robot System', 4, 'Bloqueado'),
('EQ-CUT-05', 'Hypertherm Powermax 105 (Plasma)', 1, 'Mantenimiento'),
('EQ-TIG-06', 'Fronius MagicWave 230i (TIG)', 6, 'Bloqueado');

-- Insertar Ejercicios (6 registros)
INSERT INTO ejercicios (codigo, titulo, dificultad, tematica, id_equipo) VALUES
('EJ-021', 'Soldadura TIG en Acero Inoxidable', 'Intermedio', 'soldadura', 2),
('EJ-022', 'Inspección No Destructiva por Partículas', 'Intermedio aplicado', 'soldadura', 3),
('EJ-023', 'Corte por Plasma de Placas Gruesas', 'Avanzado', 'soldadura', 5),
('EJ-024', 'bloqueos para soldadura', 'Avanzado aplicado', 'soldadura', 1),
('EJ-025', 'Programación de Celdas Robóticas', 'Avanzado aplicado', 'soldadura', 4),
('EJ-026', 'Soldadura en Posición Vertical Ascendente', 'Avanzado', 'soldadura', 6);

-- Insertar Registros de Bloqueo (6 registros)
INSERT INTO registros_bloqueo (id_equipo, id_tipo_bloqueo, tecnico_responsable, motivo, fecha_bloqueo, fecha_desbloqueo) VALUES
(1, 1, 'Ing. Carlos Ruiz', 'Fuga de corriente en la antorcha durante la ejecución del EJ-024.', '2026-03-01 08:30:00', NULL),
(4, 3, 'Téc. Sofía Martínez', 'Ajuste e inmovilización del brazo del robot para calibración.', '2026-03-01 10:00:00', NULL),
(5, 4, 'Mec. Roberto Gómez', 'Sustitución de consumibles y filtros de aire.', '2026-02-28 14:15:00', '2026-03-01 09:00:00'),
(6, 2, 'Téc. Elena Torres', 'Fuga detectada en la manguera del regulador de gas Argón.', '2026-03-02 07:45:00', NULL),
(2, 5, 'Ing. Mario Páez', 'Verificación de parámetros de amperaje.', '2026-02-25 11:20:00', '2026-02-25 13:00:00'),
(1, 6, 'Téc. Lucas Méndez', 'Activación del paro de emergencia por sobrecalentamiento.', '2026-02-20 16:00:00', '2026-02-21 08:00:00');