-- Datos de practica: soldadores, clientes y trabajos de un taller de soldadura.
USE campuslands_mysql;

INSERT INTO soldadores_intermedio (nombre, certificacion) VALUES
('Pedro Ariza', 'avanzada'),
('Camila Ortiz', 'maestro'),
('Julian Vega', 'intermedia'),
('Sofia Herrera', 'basica');

INSERT INTO clientes_soldadura_intermedio (nombre, telefono) VALUES
('Metalurgica Andina', '3001112233'),
('Taller Ruiz', '3002223344'),
('Constructora Vial', '3003334455'),
('Industrias Ferro', '3004445566');

INSERT INTO trabajos_soldadura_intermedio (id_soldador, id_cliente, tipo_soldadura, costo, fecha_trabajo) VALUES
(1, 1, 'MIG', 320.00, '2026-01-05'),
(2, 2, 'TIG', 450.00, '2026-01-12'),
(3, 3, 'arco_electrico', 280.00, '2026-02-01'),
(4, 1, 'punto', 150.00, '2026-01-08'),
(4, 4, 'MIG', 200.00, '2026-01-10'),
(1, 2, 'oxiacetilenica', 380.00, '2026-01-15'),
(2, 3, 'TIG', 520.00, '2026-02-10'),
(3, 4, 'MIG', 300.00, '2026-01-20'),
(1, 1, 'punto', 90.00, '2026-02-15');

-- Sofia Herrera (id_soldador = 4) se retira del taller. Tiene dos
-- trabajos registrados (id_trabajo 4 y 5); gracias a ON DELETE SET NULL
-- esos trabajos NO se borran, solo quedan sin soldador asignado.
DELETE FROM soldadores_intermedio
WHERE id_soldador = 4;
