USE campuslands_mysql;

INSERT INTO categorias (
    nombre,
    peso_minimo,
    peso_maximo
) VALUES
('Ligero', 55.00, 63.50),
('Welter', 63.51, 71.00),
('Medio', 71.01, 81.00),
('Pesado', 81.01, 100.00);

INSERT INTO peleadores (
    nombre,
    apellido,
    edad,
    peso,
    victorias,
    derrotas,
    estado,
    id_categoria
) VALUES
('Carlos', 'Mendez', 22, 61.50, 8, 2, 'activo', 1),
('Andres', 'Lopez', 21, 59.80, 6, 1, 'activo', 1),
('Luis', 'Gomez', 25, 68.20, 12, 3, 'activo', 2),
('Miguel', 'Castillo', 24, 69.40, 9, 5, 'activo', 2),
('Diego', 'Ramirez', 28, 76.80, 10, 4, 'activo', 3),
('Jorge', 'Hernandez', 30, 78.30, 14, 2, 'activo', 3),
('Fernando', 'Perez', 32, 91.60, 11, 6, 'activo', 4),
('Ricardo', 'Morales', 27, 62.10, 3, 4, 'inactivo', 1);