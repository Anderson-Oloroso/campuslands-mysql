-- Datos de practica: clientes y citas de un taller mecanico de motos.
-- Ninguna combinacion mecanico + fecha + hora se repite, para respetar
-- el indice unico uq_citas_taller_avanzado_mecanico_horario.
USE campuslands_mysql;

INSERT INTO clientes_taller_avanzado (nombre, telefono) VALUES
('Laura Gomez', '3001112233'),
('Carlos Ruiz', '3002223344'),
('Ana Torres', '3003334455'),
('Diego Perez', '3004445566'),
('Maria Lopez', '3005556677');

INSERT INTO citas_taller_avanzado (id_cliente, mecanico, tipo_servicio, costo, fecha_cita, hora_cita, estado) VALUES
(1, 'Pedro Ariza', 'mantenimiento', 120.00, '2026-01-10', '10:00:00', 'realizada'),
(2, 'Pedro Ariza', 'reparacion', 280.00, '2026-01-10', '15:00:00', 'realizada'),
(3, 'Sofia Herrera', 'cambio_aceite', 45.00, '2026-01-12', '11:00:00', 'realizada'),
(4, 'Sofia Herrera', 'revision_general', 90.00, '2026-01-15', '09:00:00', 'agendada'),
(5, 'Pedro Ariza', 'personalizacion', 350.00, '2026-01-20', '10:00:00', 'agendada'),
(1, 'Camila Ortiz', 'mantenimiento', 110.00, '2026-02-01', '14:00:00', 'realizada'),
(2, 'Sofia Herrera', 'reparacion', 260.00, '2026-02-05', '16:00:00', 'cancelada'),
(3, 'Camila Ortiz', 'cambio_aceite', 50.00, '2026-02-10', '11:00:00', 'realizada');
