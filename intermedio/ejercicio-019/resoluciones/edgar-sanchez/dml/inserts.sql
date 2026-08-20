-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO centros_salto (nombre_centro, ciudad, pais, altitud_base_pies) VALUES
('Skydrive Guatemala', 'Escuintla', 'Guatemala', 300),
('Skydive Miami', 'Homestead', 'Estados Unidos', 10),
('Skydive Empuriabrava', 'Girona', 'España', 5);

INSERT INTO instructores_paracaidismo (nombre_instructor, licencia_numero, nivel_certificacion, total_saltos_historicos) VALUES
('Fernando Ruiz', 'USPA-D-10293', 'AFF Instructor', 3500),
('Valeria Morales', 'USPA-TM-8821', 'Tandem Master', 1800),
('Diego Álvarez', 'USPA-C-40512', 'C', 650);

INSERT INTO clientes_paracaidismo (nombre_cliente, correo, telefono, fecha_nacimiento) VALUES
('Gabriel Méndez', 'gabriel.mendez@email.com', '+502 5555-0101', '1998-05-14'),
('Lucía Pineda', 'lucia.pineda@email.com', '+502 5555-0202', '2001-09-22'),
('Carlos Estrada', 'carlos.estrada@email.com', '+1 305 555-0303', '1995-11-03'),
('Mariana Ortiz', 'mariana.ortiz@email.com', '+34 600 555-0404', '2000-02-18');

INSERT INTO saltos_paracaidismo (centro_id, cliente_id, instructor_id, fecha_salto, modalidad, altura_salto_pies, tiempo_caida_libre_segundos, precio_salto_usd) VALUES
(1, 1, 1, '2026-06-01 09:00:00', 'AFF', 13000, 50, 250.00),
(1, 1, 1, '2026-06-15 10:30:00', 'AFF', 13000, 52, 250.00),
(1, 2, 2, '2026-07-02 11:00:00', 'Tándem', 10000, 35, 180.00),
(2, 3, 1, '2026-07-10 14:00:00', 'Wingsuit', 14500, 65, 320.00),
(2, 3, 2, '2026-07-12 15:30:00', 'Tándem', 12000, 45, 210.00),
(3, 4, 3, '2026-08-01 08:30:00', 'Salto Solo', 12000, 40, 150.00),
(1, 1, 1, '2026-08-10 09:15:00', 'AFF', 13000, 55, 250.00);