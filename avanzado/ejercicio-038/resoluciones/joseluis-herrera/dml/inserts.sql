USE campuslands_mysql;

INSERT INTO jugadores (
    nombre,
    apellido,
    posicion,
    edad,
    numero_camiseta,
    goles,
    estado,
    fecha_ingreso
) VALUES
('Carlos', 'Mendez', 'portero', 24, 1, 2, 'activo', '2024-01-15'),
('Luis', 'Gomez', 'cierre', 27, 4, 8, 'activo', '2023-08-20'),
('Diego', 'Ramirez', 'ala', 22, 7, 15, 'activo', '2024-02-10'),
('Andres', 'Lopez', 'pivot', 25, 9, 21, 'activo', '2023-05-12'),
('Miguel', 'Castillo', 'ala', 21, 10, 12, 'lesionado', '2024-03-18'),
('Jorge', 'Hernandez', 'cierre', 29, 5, 6, 'activo', '2022-11-05'),
('Fernando', 'Perez', 'pivot', 23, 11, 18, 'activo', '2024-01-28'),
('Ricardo', 'Morales', 'ala', 31, 8, 4, 'inactivo', '2022-06-14');