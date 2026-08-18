USE campuslands_mysql;

INSERT INTO peleadores (
    nombre,
    apellido,
    categoria,
    edad,
    peso,
    victorias,
    derrotas,
    estado
) VALUES
('Carlos', 'Mendez', 'ligero', 22, 63.50, 8, 2, 'activo'),
('Luis', 'Gomez', 'welter', 25, 70.20, 12, 3, 'activo'),
('Diego', 'Ramirez', 'medio', 28, 76.80, 10, 4, 'activo'),
('Andres', 'Lopez', 'ligero', 21, 61.90, 6, 1, 'activo'),
('Miguel', 'Castillo', 'welter', 24, 69.40, 9, 5, 'activo'),
('Jorge', 'Hernandez', 'medio', 30, 78.30, 14, 2, 'activo'),
('Fernando', 'Perez', 'pesado', 32, 91.60, 11, 6, 'activo'),
('Ricardo', 'Morales', 'ligero', 27, 64.10, 3, 4, 'inactivo');