USE campuslands_mysql;

INSERT INTO jugadores (
    nombre,
    equipo,
    posicion,
    edad,
    numero_camiseta,
    goles,
    estado
) VALUES
    ('Carlos Mendoza', 'Titanes FS', 'Ala', 22, 7, 8, 'activo'),
    ('Luis Ramirez', 'Titanes FS', 'Pivot', 25, 9, 12, 'activo'),
    ('Andres Castillo', 'Titanes FS', 'Cierre', 28, 4, 3, 'activo'),
    ('Miguel Torres', 'Halcones FS', 'Ala', 21, 11, 6, 'activo'),
    ('Daniel Herrera', 'Halcones FS', 'Pivot', 27, 10, 10, 'activo'),
    ('Jorge Morales', 'Halcones FS', 'Cierre', 30, 5, 2, 'lesionado'),
    ('Pedro Alvarez', 'Guerreros FS', 'Ala', 23, 8, 7, 'activo'),
    ('Sergio Navarro', 'Guerreros FS', 'Pivot', 26, 12, 9, 'suspendido'),
    ('Diego Vargas', 'Guerreros FS', 'Cierre', 29, 3, 4, 'activo'),
    ('Fernando Lopez', 'Estrellas FS', 'Ala', 20, 6, 5, 'activo');