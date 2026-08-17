-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE estudio_tatuajes;
INSERT INTO clientes (nombre, email, telefono) VALUES
('Valeria Ríos', 'valeria.rios@email.com', '+502 5555-0101'),
('Mateo Fernández', 'mateo.f@email.com', '+502 5555-0102'),
('Camila Morales', 'camila.m@email.com', '+502 5555-0103'),
('Daniel Ortiz', 'daniel.ortiz@email.com', '+502 5555-0104');

INSERT INTO tatuadores (nombre, estilo_especialidad) VALUES
('Sofi "Inks" Navarro', 'Realismo'),
('Marcos "Kuro" Silva', 'Blackwork'),
('Elena Vega', 'Neotradicional'),
('Gabriel Soto', 'Tradicional');

INSERT INTO citas (cliente_id, tatuador_id, fecha_cita, estado, costo) VALUES
(1, 1, '2026-02-10 14:00:00', 'Completada', 250.00),
(2, 2, '2026-02-12 10:30:00', 'Completada', 180.00),
(3, 3, '2026-02-20 16:00:00', 'Pendiente', 300.00),
(4, 1, '2026-02-22 11:00:00', 'Pendiente', 220.00),
(1, 4, '2026-01-15 15:00:00', 'Cancelada', 150.00);
