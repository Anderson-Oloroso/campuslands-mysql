-- Datos de practica: clientes y citas de un estudio de tatuajes.
-- Ninguna combinacion tatuador + fecha + hora se repite, para respetar
-- el indice unico uq_citas_estudio_avanzado_tatuador_horario.
USE campuslands_mysql;

INSERT INTO clientes_estudio_avanzado (nombre, telefono) VALUES
('Laura Gomez', '3001112233'),
('Carlos Ruiz', '3002223344'),
('Ana Torres', '3003334455'),
('Diego Perez', '3004445566'),
('Maria Lopez', '3005556677');

INSERT INTO citas_estudio_avanzado (id_cliente, tatuador, estilo, costo, fecha_cita, hora_cita, estado) VALUES
(1, 'Pedro Ariza', 'tradicional', 250.00, '2026-01-10', '10:00:00', 'realizada'),
(2, 'Pedro Ariza', 'blackwork', 180.00, '2026-01-10', '15:00:00', 'realizada'),
(3, 'Sofia Herrera', 'realismo', 320.00, '2026-01-12', '11:00:00', 'realizada'),
(4, 'Sofia Herrera', 'acuarela', 210.00, '2026-01-15', '09:00:00', 'agendada'),
(5, 'Pedro Ariza', 'minimalista', 90.00, '2026-01-20', '10:00:00', 'agendada'),
(1, 'Camila Ortiz', 'tradicional', 260.00, '2026-02-01', '14:00:00', 'realizada'),
(2, 'Sofia Herrera', 'blackwork', 150.00, '2026-02-05', '16:00:00', 'cancelada'),
(3, 'Camila Ortiz', 'realismo', 300.00, '2026-02-10', '11:00:00', 'realizada');
