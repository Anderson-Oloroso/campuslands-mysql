-- Datos de practica: clientes y proyectos de un estudio de arquitectura 3D.
USE campuslands_mysql;

INSERT INTO clientes_arquitectura_intermedio (nombre, ciudad) VALUES
('Constructora Andina', 'Bogota'),
('Grupo Residencial Norte', 'Medellin'),
('Inversiones Vista Verde', 'Cali'),
('Fundacion Cultural Rio', 'Bogota');

INSERT INTO proyectos_arquitectura_intermedio (id_cliente, nombre, presupuesto, fecha_inicio) VALUES
(1, 'Torre Central', 850000.00, '2026-01-10'),
(1, 'Centro Comercial Sur', 1200000.00, '2026-03-01'),
(2, 'Conjunto Residencial Pinar', 620000.00, '2026-02-05'),
(2, 'Casas Campestres El Bosque', 480000.00, '2026-04-10'),
(2, 'Edificio Vista Norte', 750000.00, '2026-05-15'),
(3, 'Oficinas Vista Verde', 390000.00, '2026-01-25'),
(4, 'Biblioteca Cultural Rio', 300000.00, '2026-02-20'),
(4, 'Auditorio Rio', 550000.00, '2026-06-01');

-- Beneficio directo de la 3FN: la empresa "Inversiones Vista Verde" se
-- traslada de ciudad. Como la ciudad vive UNA sola vez (en la tabla de
-- clientes), basta un solo UPDATE para que se refleje en todos sus
-- proyectos al consultarlos con JOIN, sin tocar la tabla de proyectos.
UPDATE clientes_arquitectura_intermedio
SET ciudad = 'Palmira'
WHERE nombre = 'Inversiones Vista Verde';
