USE campuslands_mysql;

INSERT INTO jugadores (
    nombre,
    edad,
    ranking,
    nivel,
    partidos_jugados,
    partidos_ganados,
    estado
) VALUES
    ('Carlos Mendoza', 19, 12, 'avanzado', 24, 20, 'activo'),
    ('Laura Ramirez', 22, 18, 'avanzado', 21, 17, 'activo'),
    ('Mateo Gonzalez', 16, 31, 'intermedio', 18, 12, 'activo'),
    ('Sofia Herrera', 20, 45, 'intermedio', 16, 9, 'activo'),
    ('Daniel Castillo', 14, 67, 'principiante', 12, 5, 'activo'),
    ('Valentina Lopez', 17, 24, 'avanzado', 22, 18, 'activo'),
    ('Andres Morales', 25, 53, 'intermedio', 20, 11, 'inactivo'),
    ('Camila Torres', 13, 76, 'principiante', 10, 4, 'activo'),
    ('Diego Perez', 29, 9, 'avanzado', 28, 24, 'activo'),
    ('Mariana Ortiz', 21, 38, 'intermedio', 19, 13, 'inactivo');