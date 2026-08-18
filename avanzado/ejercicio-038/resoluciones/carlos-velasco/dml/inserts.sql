USE campuslands_mysql;

INSERT INTO jugadores
    (nombre, posicion, numero_camiseta, edad, goles, asistencias, estado)
VALUES
    ('Carlos Ramirez', 'Portero', 1, 24, 0, 3, 'activo'),
    ('Mateo Gonzalez', 'Cierre', 4, 27, 5, 7, 'activo'),
    ('Diego Martinez', 'Ala', 7, 22, 9, 6, 'activo'),
    ('Andres Lopez', 'Ala', 10, 25, 12, 8, 'activo'),
    ('Samuel Herrera', 'Pivot', 9, 28, 15, 5, 'activo'),
    ('Nicolas Castillo', 'Cierre', 5, 30, 4, 4, 'lesionado'),
    ('Juan Torres', 'Ala', 11, 21, 7, 9, 'activo'),
    ('Daniel Moreno', 'Pivot', 14, 26, 10, 6, 'activo'),
    ('Felipe Vargas', 'Ala', 8, 23, 6, 10, 'activo'),
    ('Sebastian Rojas', 'Portero', 12, 29, 0, 2, 'inactivo');