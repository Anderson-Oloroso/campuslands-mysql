USE campuslands_mysql;

INSERT INTO trabajos_soldadura (
    nombre_trabajo,
    tipo_soldadura,
    soldador,
    horas_trabajadas,
    costo,
    estado,
    fecha_trabajo
) VALUES
('Estructura metalica A', 'MIG', 'Carlos Mendoza', 12.50, 850.00, 'finalizado', '2026-01-15'),
('Tuberia industrial B', 'TIG', 'Andres Ramirez', 18.00, 1450.00, 'activo', '2026-01-20'),
('Reparacion maquinaria C', 'Arco', 'Luis Herrera', 9.50, 620.00, 'finalizado', '2026-02-05'),
('Puerta industrial D', 'MIG', 'Carlos Mendoza', 7.00, 480.00, 'activo', '2026-02-18'),
('Estructura metalica E', 'MIG', 'Miguel Torres', 15.00, 1050.00, 'finalizado', '2026-03-02'),
('Tuberia industrial F', 'TIG', 'Jorge Castillo', 20.50, 1750.00, 'activo', '2026-03-15'),
('Tanque metalico G', 'TIG', 'Andres Ramirez', 16.00, 1320.00, 'finalizado', '2026-04-01'),
('Soporte industrial H', 'Arco', 'Luis Herrera', 6.50, 410.00, 'cancelado', '2026-04-12'),
('Marco estructural I', 'MIG', 'Miguel Torres', 11.00, 790.00, 'activo', '2026-05-03'),
('Reparacion tanque J', 'TIG', 'Jorge Castillo', 14.00, 1180.00, 'finalizado', '2026-05-18');