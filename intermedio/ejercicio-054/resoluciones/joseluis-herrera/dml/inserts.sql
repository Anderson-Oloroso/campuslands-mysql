USE campuslands_mysql;

INSERT INTO soldadores (
    nombre,
    especialidad,
    experiencia_anios,
    estado
) VALUES
('Carlos Mendoza', 'Soldadura MIG', 6, 'activo'),
('Andres Ramirez', 'Soldadura TIG', 8, 'activo'),
('Luis Herrera', 'Soldadura por arco', 5, 'activo'),
('Miguel Torres', 'Soldadura MIG', 4, 'activo'),
('Jorge Castillo', 'Soldadura TIG', 9, 'activo'),
('Daniel Gomez', 'Soldadura por arco', 3, 'inactivo');

INSERT INTO trabajos_soldadura (
    id_soldador,
    nombre_trabajo,
    tipo_soldadura,
    horas_trabajadas,
    costo,
    fecha_trabajo
) VALUES
(1, 'Estructura metalica A', 'MIG', 12.50, 850.00, '2026-01-15'),
(2, 'Tuberia industrial B', 'TIG', 18.00, 1450.00, '2026-01-20'),
(3, 'Reparacion maquinaria C', 'Arco', 9.50, 620.00, '2026-02-05'),
(1, 'Puerta industrial D', 'MIG', 7.00, 480.00, '2026-02-18'),
(4, 'Estructura metalica E', 'MIG', 15.00, 1050.00, '2026-03-02'),
(5, 'Tuberia industrial F', 'TIG', 20.50, 1750.00, '2026-03-15'),
(2, 'Tanque metalico G', 'TIG', 16.00, 1320.00, '2026-04-01'),
(3, 'Soporte industrial H', 'Arco', 6.50, 410.00, '2026-04-12'),
(4, 'Marco estructural I', 'MIG', 11.00, 790.00, '2026-05-03'),
(5, 'Reparacion tanque J', 'TIG', 14.00, 1180.00, '2026-05-18');