USE campuslands_mysql;

-- Inserción de Paracaidistas
INSERT INTO paracaidistas (nombre, apellido, email, licencia, fecha_nacimiento) VALUES
('Carlos', 'Mendoza', 'carlos.mendoza@email.com', 'A', '1998-05-14'),
('Valeria', 'Silva', 'valeria.silva@email.com', 'Alumno', '2001-11-20'),
('Diego', 'Arriola', 'diego.arriola@email.com', 'B', '1995-03-08'),
('Sofía', 'Ramírez', 'sofia.ramirez@email.com', 'C', '1992-09-30'),
('Kenia', 'Rosales', 'kenia.rosales@email.com', 'Alumno', '2000-07-12');

-- Inserción de Instructores
INSERT INTO instructores (nombre, apellido, licencia_instructor, tarifa_salto) VALUES
('Fernando', 'Castillo', 'USPA-AFF-1029', 120.00),
('Gabriela', 'Morales', 'USPA-TANDEM-8841', 95.00),
('Roberto', 'Gómez', 'USPA-AFF-3312', 110.00);

-- Inserción de Zonas de Salto (Dropzones)
INSERT INTO zonas_salto (nombre_dropzone, ubicacion, altitud_maxima_pies) VALUES
('Skydive Atitlán', 'Sololá, Guatemala', 14000),
('Skydive Puerto San José', 'Escuintla, Guatemala', 12000),
('Skydive Tequesquitengo', 'Morelos, México', 15000);

-- Inserción de Saltos
INSERT INTO saltos (paracaidista_id, instructor_id, dropzone_id, fecha_salto, modalidad, altitud_pies, tiempo_caida_libre_seg, costo, estado_salto) VALUES
(1, 1, 1, '2026-01-10 09:00:00', 'Solo AFF', 13000, 55, 250.00, 'Completado'),
(2, 2, 1, '2026-01-10 10:30:00', 'Tandem', 10000, 35, 190.00, 'Completado'),
(3, 3, 2, '2026-01-15 11:00:00', 'Formacion', 12000, 48, 210.00, 'Completado'),
(1, 1, 1, '2026-02-01 08:30:00', 'Solo AFF', 14000, 60, 260.00, 'Completado'),
(4, NULL, 3, '2026-02-12 14:00:00', 'Wingsuit', 15000, 90, 300.00, 'Completado'),
(5, 2, 2, '2026-02-18 10:00:00', 'Tandem', 10000, 32, 190.00, 'Completado'),
(3, 3, 1, '2026-03-05 09:15:00', 'Freestyle', 13500, 58, 240.00, 'Completado'),
(1, 1, 3, '2026-03-20 12:00:00', 'Solo AFF', 14500, 62, 280.00, 'Completado'),
(2, 2, 2, '2026-04-02 11:30:00', 'Tandem', 10000, 30, 190.00, 'Cancelado'),
(4, NULL, 3, '2026-04-15 15:00:00', 'Wingsuit', 15000, 95, 300.00, 'Completado');