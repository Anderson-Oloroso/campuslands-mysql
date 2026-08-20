USE campuslands_mysql;

INSERT INTO jugadores (
    nickname,
    nombre,
    rango,
    puntaje,
    estado
) VALUES
('ShadowBR', 'Carlos Mendoza', 'Diamante', 2450.50, 'activo'),
('RexGaming', 'Diego Ramirez', 'Maestro', 3180.75, 'activo'),
('LuiPro', 'Luis Torres', 'Platino', 1780.25, 'activo'),
('AndroBR', 'Andres Castillo', 'Diamante', 2765.00, 'activo'),
('VargasX', 'Mateo Vargas', 'Maestro', 3520.90, 'activo'),
('JorgeStorm', 'Jorge Navarro', 'Oro', 1325.40, 'activo'),
('DaniBattle', 'Daniel Herrera', 'Platino', 2210.60, 'activo'),
('NovaBR', 'Kevin Morales', 'Plata', 980.15, 'inactivo');


INSERT INTO partidas (
    id_jugador,
    posicion_final,
    eliminaciones,
    fecha_partida
) VALUES
(1, 3, 8, '2026-07-01'),
(1, 7, 5, '2026-07-03'),
(2, 1, 12, '2026-07-01'),
(2, 2, 10, '2026-07-05'),
(3, 8, 3, '2026-07-02'),
(3, 5, 6, '2026-07-06'),
(4, 4, 9, '2026-07-03'),
(4, 2, 11, '2026-07-07'),
(5, 1, 15, '2026-07-04'),
(5, 3, 9, '2026-07-08'),
(6, 10, 2, '2026-07-05'),
(7, 6, 7, '2026-07-06');