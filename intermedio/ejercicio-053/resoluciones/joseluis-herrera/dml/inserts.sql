USE campuslands_mysql;

INSERT INTO arquitectos (
    nombre,
    especialidad,
    experiencia_anios
) VALUES
('Laura Gomez', 'Arquitectura residencial', 5),
('Carlos Ramirez', 'Arquitectura comercial', 8),
('Sofia Martinez', 'Arquitectura sostenible', 6),
('Daniel Torres', 'Arquitectura urbana', 10),
('Valentina Ruiz', 'Diseño arquitectonico', 4);

INSERT INTO tipos_proyecto (
    nombre_tipo
) VALUES
('Residencial'),
('Comercial'),
('Cultural'),
('Educativo'),
('Urbano');

INSERT INTO estados_proyecto (
    nombre_estado
) VALUES
('diseno'),
('revision'),
('aprobado'),
('finalizado');

INSERT INTO proyectos (
    nombre_proyecto,
    id_arquitecto,
    id_tipo,
    id_estado,
    area_m2,
    presupuesto,
    fecha_entrega
) VALUES
('Torre Horizonte', 1, 1, 3, 850.50, 1250000.00, '2026-03-15'),
('Centro Cultural Norte', 2, 3, 2, 1450.75, 2100000.00, '2026-04-20'),
('Casa Moderna 01', 3, 1, 4, 320.40, 480000.00, '2026-02-10'),
('Complejo Empresarial', 2, 2, 1, 2300.00, 3500000.00, '2026-06-05'),
('Museo Digital', 4, 3, 3, 1780.25, 2900000.00, '2026-07-18'),
('Edificio Central', 2, 2, 2, 1950.60, 3150000.00, '2026-08-01'),
('Casa Contemporanea', 5, 1, 4, 410.80, 620000.00, '2026-05-22'),
('Plaza Innovacion', 4, 5, 1, 2750.30, 4200000.00, '2026-09-10'),
('Biblioteca Urbana', 1, 4, 3, 1120.45, 1800000.00, '2026-10-05'),
('Pabellon Tecnologico', 3, 4, 2, 980.90, 1550000.00, '2026-11-12');