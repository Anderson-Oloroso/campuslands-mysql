USE estudio_tatuajes_db;

INSERT INTO estilos_tatuaje (nombre_estilo, descripcion_estilo) VALUES
('Neo-Tradicional', 'Lineas gruesas, paleta de colores vibrantes y elementos decorativos modernos'),
('Realismo en Sombras', 'Retratos y disenos fotorealistas trabajados unicamente en escala de grises'),
('Fine Line (Linea Fina)', 'Trazos delicados, minimalistas y elegantes de gran precision'),
('Cyberpunk / Neon', 'Estetica futurista con contrastes altos y colores fluorescentes'),
('Old School (Tradicional)', 'Disenos clasicos de la vieja escuela con contornos solidos y colores primarios');

INSERT INTO citas_tatuajes (codigo_cita, nombre_cliente, nombre_artista, id_estilo, costo_estimado, duracion_horas, fecha_cita, estado_cita) VALUES
('TAT-2026-001', 'Valeria Gomez', 'Kike Calavera', 1, 350.00, 4, '2026-08-01', 'completada'),
('TAT-2026-002', 'Mateo Restrepo', 'Camila Ink', 2, 600.00, 7, '2026-08-05', 'completada'),
('TAT-2026-003', 'Angela Arrivillaga', 'Jinx Tattoo', 4, 450.00, 5, '2026-08-10', 'en_proceso'),
('TAT-2026-004', 'Sebastian Morales', 'Kike Calavera', 5, 200.00, 2, '2026-08-15', 'programada'),
('TAT-2026-005', 'Daniela Ruiz', 'Camila Ink', 3, 180.00, 2, '2026-08-18', 'programada'),
('TAT-2026-006', 'Esteban Cardenas', 'Jinx Tattoo', 4, 520.00, 6, '2026-08-20', 'programada'),
('TAT-2026-007', 'Sofia Montero', 'Kike Calavera', 1, 310.00, 3, '2026-07-25', 'cancelada'),
('TAT-2026-008', 'Alejandro Rios', 'Camila Ink', 2, 750.00, 8, '2026-08-22', 'programada');