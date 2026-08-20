USE paracaidismo_db;

INSERT INTO tipos_salto (nombre_modalidad, descripcion_modalidad, altura_salto_pies) VALUES
('Tandem', 'Salto unido a un instructor experto', 10000),
('AFF (Skydive First Jump)', 'Primer nivel del curso de aceleracion de caida libre', 12000),
('Solo Jump', 'Salto independiente para paracaidistas licenciados', 14000),
('Freefly', 'Maniobras avanzadas en caida libre en diferentes posiciones', 15000);

INSERT INTO saltos_paracaidismo (codigo_registro, nombre_paracaidista, id_tipo_salto, costo_salto, duracion_caida_libre_seg, fecha_salto, estado_salto) VALUES
('SK-TN-001', 'Sofia Montero', 1, 220.50, 45, '2026-08-01', 'completado'),
('SK-AFF-002', 'Mateo Vargas', 2, 350.00, 55, '2026-08-05', 'completado'),
('SK-SL-003', 'Angela Arrivillaga', 3, 180.00, 60, '2026-08-10', 'completado'),
('SK-FF-004', 'Carlos Andres Gomez', 4, 290.00, 70, '2026-08-12', 'programado'),
('SK-TN-005', 'Valentina Ruiz', 1, 220.50, 45, '2026-08-15', 'programado'),
('SK-SL-006', 'Alejandro Morales', 3, 180.00, 60, '2026-08-18', 'en_espera'),
('SK-AFF-007', 'Lucia Fernandez', 2, 350.00, 55, '2026-06-20', 'cancelado'),
('SK-FF-008', 'Esteban Restrepo', 4, 290.00, 70, '2026-08-20', 'programado');