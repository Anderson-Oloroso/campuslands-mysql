USE campuslands_mysql;

INSERT INTO proyectos_arquitectura (
    nombre_proyecto,
    arquitecto,
    tipo_proyecto,
    area_m2,
    presupuesto,
    estado,
    fecha_entrega
) VALUES
('Torre Horizonte', 'Laura Gomez', 'Residencial', 850.50, 1250000.00, 'aprobado', '2026-03-15'),
('Centro Cultural Norte', 'Carlos Ramirez', 'Cultural', 1450.75, 2100000.00, 'revision', '2026-04-20'),
('Casa Moderna 01', 'Sofia Martinez', 'Residencial', 320.40, 480000.00, 'finalizado', '2026-02-10'),
('Complejo Empresarial', 'Daniel Torres', 'Comercial', 2300.00, 3500000.00, 'diseno', '2026-06-05'),
('Museo Digital', 'Laura Gomez', 'Cultural', 1780.25, 2900000.00, 'aprobado', '2026-07-18'),
('Edificio Central', 'Carlos Ramirez', 'Comercial', 1950.60, 3150000.00, 'revision', '2026-08-01'),
('Casa Contemporanea', 'Sofia Martinez', 'Residencial', 410.80, 620000.00, 'finalizado', '2026-05-22'),
('Plaza Innovacion', 'Daniel Torres', 'Comercial', 2750.30, 4200000.00, 'diseno', '2026-09-10'),
('Biblioteca Urbana', 'Laura Gomez', 'Educativo', 1120.45, 1800000.00, 'aprobado', '2026-10-05'),
('Pabellon Tecnologico', 'Sofia Martinez', 'Educativo', 980.90, 1550000.00, 'revision', '2026-11-12');