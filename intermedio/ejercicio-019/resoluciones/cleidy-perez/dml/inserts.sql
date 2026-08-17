-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE escuela_paracaidismo;
INSERT INTO paracaidistas (nombre, nivel_experiencia) VALUES
('Alejandro Ríos', 'Principiante'),
('Mariana Torres', 'Intermedio'),
('Diego Mendoza', 'Avanzado'),
('Sofia Castillo', 'Principiante');

INSERT INTO instructores (nombre, saltos_certificados) VALUES
('Carlos Vane', 1200),
('Elena Rostova', 850),
('Marcos Silva', 2100);

INSERT INTO saltos (paracaidista_id, instructor_id, altitud_pies, tipo_salto, precio, fecha_salto) VALUES
(1, 1, 10000, 'Tándem', 220.00, '2026-01-15'),
(1, 1, 12000, 'Tándem', 250.00, '2026-02-01'),
(1, 2, 12000, 'Solo AFF', 280.00, '2026-02-10'),
(2, 2, 14000, 'Solo AFF', 300.00, '2026-01-20'),
(2, 3, 14000, 'Formación', 320.00, '2026-02-05'),
(3, 3, 15000, 'Formación', 350.00, '2026-02-12'),
(4, 1, 10000, 'Tándem', 220.00, '2026-02-14');