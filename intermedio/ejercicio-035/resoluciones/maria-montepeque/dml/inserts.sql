-- Datos de practica: clientes y citas de un taller mecanico de motos.
-- Maria Lopez se deja sin ninguna cita a proposito, para NOT EXISTS.
USE campuslands_mysql;

INSERT INTO clientes_taller_intermedio (nombre, ciudad) VALUES
('Laura Gomez', 'Bogota'),
('Carlos Ruiz', 'Medellin'),
('Ana Torres', 'Cali'),
('Diego Perez', 'Bogota'),
('Maria Lopez', 'Medellin');

INSERT INTO citas_taller_intermedio (id_cliente, mecanico, tipo_servicio, costo, fecha_cita, estado) VALUES
(1, 'Pedro Ariza', 'mantenimiento', 120.00, '2026-01-05', 'realizada'),
(1, 'Sofia Herrera', 'cambio_aceite', 45.00, '2026-02-01', 'realizada'),
(2, 'Pedro Ariza', 'reparacion', 280.00, '2026-01-15', 'realizada'),
(2, 'Camila Ortiz', 'revision_general', 90.00, '2026-02-05', 'agendada'),
(3, 'Camila Ortiz', 'cambio_aceite', 50.00, '2026-01-20', 'realizada'),
(3, 'Pedro Ariza', 'personalizacion', 350.00, '2026-02-10', 'cancelada'),
(4, 'Sofia Herrera', 'reparacion', 260.00, '2026-01-25', 'realizada'),
(4, 'Pedro Ariza', 'mantenimiento', 110.00, '2026-02-15', 'agendada'),
(1, 'Camila Ortiz', 'revision_general', 95.00, '2026-02-20', 'realizada');
