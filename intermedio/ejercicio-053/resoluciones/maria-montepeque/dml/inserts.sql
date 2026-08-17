-- Datos de practica: clientes y encargos de un estudio de arquitectura 3D.
USE campuslands_mysql;

INSERT INTO clientes_arq_intermedio (nombre, ciudad) VALUES
('Constructora del Valle', 'Bogota'),
('Grupo Habitat Norte', 'Medellin'),
('Inversiones Costa Azul', 'Cali'),
('Fundacion Cultural Sur', 'Bogota');

INSERT INTO encargos_arq_intermedio (id_cliente, nombre, presupuesto, fecha_inicio) VALUES
(1, 'Torre Empresarial Central', 890000.00, '2026-01-10'),
(1, 'Centro Comercial Occidente', 1250000.00, '2026-03-01'),
(2, 'Conjunto Residencial Roble', 640000.00, '2026-02-05'),
(2, 'Casas Campestres Alameda', 500000.00, '2026-04-10'),
(2, 'Edificio Vista Sur', 770000.00, '2026-05-15'),
(3, 'Oficinas Costa Azul', 400000.00, '2026-01-25'),
(4, 'Biblioteca Cultural Sur', 320000.00, '2026-02-20'),
(4, 'Auditorio Sur', 570000.00, '2026-06-01');

-- Beneficio directo de la 3FN: la empresa "Inversiones Costa Azul" se
-- traslada de ciudad. Como la ciudad vive UNA sola vez (en la tabla de
-- clientes), basta un solo UPDATE para que se refleje en todos sus
-- encargos al consultarlos con JOIN, sin tocar la tabla de encargos.
UPDATE clientes_arq_intermedio
SET ciudad = 'Palmira'
WHERE nombre = 'Inversiones Costa Azul';
