USE campuslands_mysql;

INSERT INTO equipos (
    nombre,
    region,
    estado
) VALUES
('Dragon Force', 'LATAM', 'activo'),
('Shadow Wolves', 'Norteamerica', 'activo'),
('Titan Gaming', 'Europa', 'activo'),
('Nova Esports', 'LATAM', 'inactivo');

INSERT INTO jugadores (
    id_equipo,
    nombre,
    rol,
    edad
) VALUES
(1, 'Carlos Mendoza', 'Top', 21),
(1, 'Diego Ramirez', 'Jungla', 23),
(1, 'Luis Torres', 'Mid', 20),
(2, 'Andres Castillo', 'ADC', 22),
(2, 'Mateo Vargas', 'Support', 24),
(2, 'Jorge Navarro', 'Top', 21),
(3, 'Daniel Herrera', 'Mid', 19),
(3, 'Santiago Lopez', 'Jungla', 25),
(3, 'Miguel Santos', 'Support', 22),
(4, 'Kevin Morales', 'ADC', 20);