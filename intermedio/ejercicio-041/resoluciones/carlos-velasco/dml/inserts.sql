USE campuslands_mysql;

INSERT INTO jugadores_pingpong (
    nombre_completo,
    documento,
    categoria,
    edad,
    ranking_actual,
    victorias,
    derrotas,
    estado
) VALUES
    ('Carlos Mendoza', 'PP-1001', 'Senior', 24, 8, 18, 5, 'activo'),
    ('Laura Castillo', 'PP-1002', 'Senior', 27, 3, 22, 4, 'activo'),
    ('Mateo Ramirez', 'PP-1003', 'Juvenil', 17, 15, 14, 8, 'activo'),
    ('Sofia Herrera', 'PP-1004', 'Senior', 31, 12, 16, 9, 'activo'),
    ('Daniel Torres', 'PP-1005', 'Juvenil', 16, 21, 11, 10, 'activo'),
    ('Valentina Rojas', 'PP-1006', 'Senior', 29, 6, 20, 6, 'activo'),
    ('Andres Molina', 'PP-1007', 'Juvenil', 18, 28, 9, 13, 'inactivo'),
    ('Camila Vargas', 'PP-1008', 'Senior', 25, 17, 13, 11, 'activo'),
    ('Nicolas Gomez', 'PP-1009', 'Juvenil', 15, 24, 10, 12, 'activo'),
    ('Isabella Cruz', 'PP-1010', 'Senior', 22, 10, 17, 7, 'inactivo');