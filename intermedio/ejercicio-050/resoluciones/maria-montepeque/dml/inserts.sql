-- Datos de practica: clientes y citas de un estudio de tatuajes.
-- Maria Lopez se deja sin ninguna cita a proposito, para NOT EXISTS.
USE campuslands_mysql;

INSERT INTO clientes_estudio_intermedio (nombre, ciudad) VALUES
('Laura Gomez', 'Bogota'),
('Carlos Ruiz', 'Medellin'),
('Ana Torres', 'Cali'),
('Diego Perez', 'Bogota'),
('Maria Lopez', 'Medellin');

INSERT INTO citas_estudio_intermedio (id_cliente, tatuador, estilo, costo, fecha_cita, estado) VALUES
(1, 'Pedro Ariza', 'tradicional', 250.00, '2026-01-05', 'realizada'),
(1, 'Sofia Herrera', 'realismo', 320.00, '2026-02-01', 'realizada'),
(2, 'Pedro Ariza', 'blackwork', 180.00, '2026-01-15', 'realizada'),
(2, 'Camila Ortiz', 'acuarela', 210.00, '2026-02-05', 'agendada'),
(3, 'Camila Ortiz', 'minimalista', 90.00, '2026-01-20', 'realizada'),
(3, 'Pedro Ariza', 'tradicional', 260.00, '2026-02-10', 'cancelada'),
(4, 'Sofia Herrera', 'realismo', 300.00, '2026-01-25', 'realizada'),
(4, 'Pedro Ariza', 'blackwork', 150.00, '2026-02-15', 'agendada'),
(1, 'Camila Ortiz', 'acuarela', 230.00, '2026-02-20', 'realizada');
