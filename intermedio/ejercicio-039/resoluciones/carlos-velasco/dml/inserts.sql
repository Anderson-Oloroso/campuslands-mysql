USE campuslands_mysql;

INSERT INTO entrenadores (
    nombre,
    especialidad,
    estado
) VALUES
    ('Marco Salazar', 'Boxeo', 'activo'),
    ('Daniel Rojas', 'Muay Thai', 'activo'),
    ('Andres Molina', 'Kickboxing', 'activo'),
    ('Jorge Castillo', 'Defensa y acondicionamiento', 'activo'),
    ('Ricardo Perez', 'Preparacion fisica', 'inactivo');

INSERT INTO peleadores (
    nombre,
    edad,
    categoria_peso,
    victorias,
    derrotas,
    id_entrenador
) VALUES
    ('Carlos Mendoza', 24, 'Peso ligero', 12, 2, 1),
    ('Diego Ramirez', 27, 'Peso welter', 15, 3, 2),
    ('Luis Herrera', 22, 'Peso ligero', 8, 1, 3),
    ('Mateo Castillo', 29, 'Peso medio', 18, 4, 1),
    ('Javier Lopez', 25, 'Peso welter', 10, 5, 2),
    ('Fernando Garcia', 31, 'Peso medio', 20, 6, 4),
    ('Sergio Flores', 23, 'Peso pesado', 7, 2, 3),
    ('Miguel Santos', 28, 'Peso pesado', 14, 4, 4),
    ('Alejandro Cruz', 26, 'Peso ligero', 11, 3, 1),
    ('Pablo Ortiz', 30, 'Peso welter', 16, 7, 2);