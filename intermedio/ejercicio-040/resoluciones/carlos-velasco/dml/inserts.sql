USE campuslands_mysql;

INSERT INTO participantes_carreras (
    nombre_completo,
    documento,
    categoria,
    ciudad,
    edad,
    tiempo_mejor_marca,
    estado
) VALUES
    ('Mateo Ramirez', 'CR-1001', '5K', 'Bogota', 22, 18.45, 'activo'),
    ('Laura Martinez', 'CR-1002', '10K', 'Medellin', 27, 39.80, 'activo'),
    ('Daniel Castillo', 'CR-1003', '5K', 'Cali', 24, 19.20, 'activo'),
    ('Sofia Herrera', 'CR-1004', '21K', 'Bogota', 31, 92.35, 'activo'),
    ('Andres Molina', 'CR-1005', '10K', 'Barranquilla', 29, 41.15, 'activo'),
    ('Valentina Cruz', 'CR-1006', '5K', 'Medellin', 21, 20.10, 'inactivo'),
    ('Sebastian Torres', 'CR-1007', '21K', 'Cali', 35, 88.90, 'activo'),
    ('Camila Rojas', 'CR-1008', '10K', 'Bogota', 26, 38.75, 'activo'),
    ('Nicolas Vargas', 'CR-1009', '5K', 'Barranquilla', 19, 21.40, 'activo'),
    ('Isabella Gomez', 'CR-1010', '21K', 'Medellin', 28, 95.60, 'inactivo');