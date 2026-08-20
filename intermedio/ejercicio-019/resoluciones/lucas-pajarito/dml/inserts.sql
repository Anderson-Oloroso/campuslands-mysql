USE intermedio_paracaidismo;

-- Carga de Zonas de Salto (Dropzones)
INSERT INTO zonas_salto_019 (nombre_dropzone, ubicacion, altitud_max_pies) VALUES
('Skydive Guatemala', 'Escuintla', 14000),
('Skydive Caribe', 'Cancún', 15000),
('Skydive Andes', 'Mendoza', 12000),
('Skydive Pacífico', 'Puerto San José', 10000);

-- Carga de Instructores
INSERT INTO instructores_019 (nombre, licencia_faa, tarifa_base) VALUES
('Carlos Mendoza', 'D-38912', 120.00),
('Andrea López', 'D-41205', 150.00),
('Fernando Gómez', 'C-19820', 95.00),
('Sofía Ramírez', 'D-50110', 135.00);

-- Carga de Paracaidistas
INSERT INTO paracaidistas_019 (nombre, correo, nivel_experiencia) VALUES
('Lucas Pajarito', 'lucas.pajarito@email.com', 'Licenciado B'),
('Mariana Estrada', 'mariana.estrada@email.com', 'Tándem'),
('Mateo Morales', 'mateo.morales@email.com', 'Estudiante'),
('Sofia Ruiz', 'sofia.ruiz@email.com', 'Master'),
('Gabriel Estrada', 'gabriel.estrada@email.com', 'Licenciado A');

-- Carga de Registros de Saltos Transaccionales
INSERT INTO saltos_019 (paracaidista_id, instructor_id, zona_id, altitud_pies, monto_pago, fecha_salto) VALUES
(1, 1, 1, 14000, 350.00, '2026-08-01 09:30:00'),
(2, 2, 1, 10000, 220.00, '2026-08-02 11:15:00'),
(3, 3, 2, 12000, 280.00, '2026-08-03 14:00:00'),
(4, 1, 1, 15000, 400.00, '2026-08-04 10:45:00'),
(1, 2, 2, 14000, 350.00, '2026-08-05 16:20:00'),
(1, 1, 1, 14000, 350.00, '2026-08-07 10:00:00'),
(3, 3, 3, 10000, 250.00, '2026-08-08 12:30:00'),
(4, 4, 1, 15000, 420.00, '2026-08-10 09:00:00'),
(5, 2, 4, 9000,  180.00, '2026-08-11 15:10:00');