USE campuslands_mysql;

INSERT INTO ciudades (nombre) VALUES
    ('Ciudad de Guatemala'),
    ('Quetzaltenango'),
    ('Escuintla'),
    ('Antigua Guatemala'),
    ('Cobán');

INSERT INTO posiciones (nombre) VALUES
    ('Portero'),
    ('Cierre'),
    ('Ala'),
    ('Pivot');

INSERT INTO equipos_futsal (nombre, id_ciudad, estado) VALUES
    ('Halcones Futsal', 1, 'activo'),
    ('Leones Futsal', 2, 'activo'),
    ('Toros Futsal', 3, 'activo'),
    ('Aguilas Futsal', 4, 'activo'),
    ('Lobos Futsal', 5, 'inactivo');

INSERT INTO jugadores_futsal (
    nombre,
    edad,
    numero_camiseta,
    id_equipo,
    id_posicion
) VALUES
    ('Carlos Mendoza', 24, 1, 1, 1),
    ('Diego Ramirez', 22, 4, 1, 2),
    ('Luis Herrera', 21, 7, 1, 3),
    ('Mateo Castillo', 25, 9, 1, 4),

    ('Andres Morales', 27, 1, 2, 1),
    ('Javier Lopez', 23, 5, 2, 2),
    ('Daniel Garcia', 20, 8, 2, 3),
    ('Fernando Perez', 26, 10, 2, 4),

    ('Miguel Santos', 28, 1, 3, 1),
    ('Ricardo Flores', 24, 6, 3, 2),

    ('Sergio Vasquez', 23, 1, 4, 1),
    ('Alejandro Cruz', 21, 11, 4, 4),

    ('Pablo Ortiz', 29, 1, 5, 1);