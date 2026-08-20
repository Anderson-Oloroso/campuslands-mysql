USE campuslands_mysql;


INSERT INTO equipos (
    nombre,
    ciudad
) VALUES
    ('Titanes FS', 'Guatemala'),
    ('Halcones FS', 'Quetzaltenango'),
    ('Guerreros FS', 'Escuintla'),
    ('Estrellas FS', 'Antigua Guatemala');


INSERT INTO posiciones (
    nombre
) VALUES
    ('Ala'),
    ('Pivot'),
    ('Cierre'),
    ('Portero');


INSERT INTO jugadores (
    nombre,
    edad,
    numero_camiseta,
    goles,
    estado,
    equipo_id,
    posicion_id
) VALUES
    ('Carlos Mendoza', 22, 7, 8, 'activo', 1, 1),
    ('Luis Ramirez', 25, 9, 12, 'activo', 1, 2),
    ('Andres Castillo', 28, 4, 3, 'activo', 1, 3),

    ('Miguel Torres', 21, 11, 6, 'activo', 2, 1),
    ('Daniel Herrera', 27, 10, 10, 'activo', 2, 2),
    ('Jorge Morales', 30, 5, 2, 'lesionado', 2, 3),

    ('Pedro Alvarez', 23, 8, 7, 'activo', 3, 1),
    ('Sergio Navarro', 26, 12, 9, 'suspendido', 3, 2),
    ('Diego Vargas', 29, 3, 4, 'activo', 3, 3),

    ('Fernando Lopez', 20, 6, 5, 'activo', 4, 1);