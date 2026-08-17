-- Datos de practica: tecnicos, empresas y ordenes de un taller de soldadura.
USE campuslands_mysql;

INSERT INTO tecnicos_soldadura_intermedio (nombre, certificacion) VALUES
('Ramiro Peralta', 'avanzada'),
('Lucia Bermudez', 'maestro'),
('Ivan Rojas', 'intermedia'),
('Marcela Suarez', 'basica');

INSERT INTO empresas_soldadura_intermedio (nombre, telefono) VALUES
('Metalurgica Rio Verde', '3011112233'),
('Taller Fonseca', '3012223344'),
('Constructora Sendero', '3013334455'),
('Industrias Delta', '3014445566');

INSERT INTO ordenes_soldadura_intermedio (id_tecnico, id_empresa, tipo_soldadura, costo, fecha_orden) VALUES
(1, 1, 'MIG', 330.00, '2026-01-05'),
(2, 2, 'TIG', 460.00, '2026-01-12'),
(3, 3, 'arco_electrico', 290.00, '2026-02-01'),
(4, 1, 'punto', 155.00, '2026-01-08'),
(4, 4, 'MIG', 210.00, '2026-01-10'),
(1, 2, 'oxiacetilenica', 390.00, '2026-01-15'),
(2, 3, 'TIG', 530.00, '2026-02-10'),
(3, 4, 'MIG', 310.00, '2026-01-20'),
(1, 1, 'punto', 95.00, '2026-02-15');

-- Marcela Suarez (id_tecnico = 4) se retira del taller. Tiene dos
-- ordenes registradas (id_orden 4 y 5); gracias a ON DELETE SET NULL
-- esas ordenes NO se borran, solo quedan sin tecnico asignado.
DELETE FROM tecnicos_soldadura_intermedio
WHERE id_tecnico = 4;
