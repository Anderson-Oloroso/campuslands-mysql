-- Datos de practica: clientes y citas de un estudio de tatuajes.
-- Maria Lopez se deja sin ninguna cita a proposito, para NOT EXISTS.
USE campuslands_mysql;

INSERT INTO clientes_estudio_intermedio (nombre, ciudad) VALUES
('Laura Gomez', 'Bogota'),
('Carlos Ruiz', 'Medellin'),
('Ana Torres', 'Cali'),
('Diego Perez', 'Bogota'),
('Maria Lopez', 'Medellin');

INSERT INTO citas_estudio_intermedio (id_cliente, tatuador, estilo, precio, fecha_cita, estado) VALUES
(1, 'Kike Nunez', 'tradicional', 280.00, '2026-01-10', 'realizada'),
(1, 'Sara Bonilla', 'japones', 650.00, '2026-02-01', 'realizada'),
(2, 'Kike Nunez', 'realismo', 720.00, '2026-01-15', 'realizada'),
(2, 'Vale Restrepo', 'blackwork', 350.00, '2026-02-05', 'agendada'),
(3, 'Vale Restrepo', 'acuarela', 220.00, '2026-01-20', 'realizada'),
(3, 'Kike Nunez', 'minimalista', 150.00, '2026-02-10', 'cancelada'),
(4, 'Sara Bonilla', 'realismo', 700.00, '2026-01-25', 'realizada'),
(4, 'Kike Nunez', 'tradicional', 300.00, '2026-02-15', 'agendada'),
(1, 'Vale Restrepo', 'blackwork', 400.00, '2026-02-20', 'realizada');
