USE campuslands_mysql;

INSERT INTO peleadores (
    nombre,
    apellido,
    categoria,
    edad,
    peso,
    victorias,
    derrotas,
    estado,
    fecha_registro
) VALUES
('Carlos', 'Mendez', 'Ligero', 22, 61.50, 8, 2, 'activo', '2024-01-15'),
('Luis', 'Gomez', 'Welter', 25, 68.20, 12, 3, 'activo', '2024-02-10'),
('Diego', 'Ramirez', 'Medio', 28, 76.80, 10, 4, 'activo', '2024-03-05'),
('Andres', 'Lopez', 'Ligero', 21, 59.80, 6, 1, 'activo', '2024-03-20'),
('Miguel', 'Castillo', 'Welter', 24, 69.40, 9, 5, 'activo', '2024-04-12'),
('Jorge', 'Hernandez', 'Medio', 30, 78.30, 14, 2, 'activo', '2024-05-08'),
('Fernando', 'Perez', 'Pesado', 32, 91.60, 11, 6, 'activo', '2024-06-18'),
('Ricardo', 'Morales', 'Ligero', 27, 62.10, 3, 4, 'inactivo', '2024-07-01');