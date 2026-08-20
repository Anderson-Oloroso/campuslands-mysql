USE campuslands_mysql;

INSERT INTO jugadores (
    nombre,
    apellido,
    categoria,
    edad,
    ranking,
    partidos_ganados,
    partidos_perdidos,
    estado
) VALUES
('Carlos', 'Mendez', 'juvenil', 16, 1, 15, 3, 'activo'),
('Laura', 'Gomez', 'juvenil', 17, 2, 13, 4, 'activo'),
('Diego', 'Ramirez', 'adulto', 24, 3, 18, 5, 'activo'),
('Ana', 'Lopez', 'adulto', 26, 4, 16, 6, 'activo'),
('Miguel', 'Castillo', 'adulto', 29, 5, 12, 8, 'activo'),
('Sofia', 'Hernandez', 'senior', 38, 6, 10, 7, 'activo'),
('Jorge', 'Perez', 'senior', 42, 7, 8, 9, 'activo'),
('Ricardo', 'Morales', 'adulto', 31, 8, 5, 12, 'inactivo');