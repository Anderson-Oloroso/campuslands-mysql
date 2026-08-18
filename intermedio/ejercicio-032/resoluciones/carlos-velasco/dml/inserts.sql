USE campuslands_mysql;

INSERT INTO jugadores (
    nombre_jugador,
    plataforma,
    nivel,
    estado
) VALUES
('ShadowX', 'PC', 85, 'activo'),
('Raptor', 'PlayStation', 72, 'activo'),
('NovaFire', 'Xbox', 91, 'activo'),
('DarkWolf', 'PC', 64, 'activo'),
('Storm', 'PlayStation', 78, 'activo'),
('Ghost', 'PC', 55, 'inactivo'),
('Titan', 'Xbox', 88, 'activo'),
('Blaze', 'PC', 47, 'activo'),
('Viper', 'PlayStation', 69, 'activo'),
('Zero', 'Xbox', 35, 'activo');

INSERT INTO partidas (
    id_jugador,
    posicion_final,
    eliminaciones,
    puntos,
    fecha_partida
) VALUES
(1, 1, 8, 120, '2026-07-01'),
(1, 4, 5, 82, '2026-07-03'),
(2, 2, 7, 105, '2026-07-02'),
(2, 8, 3, 55, '2026-07-05'),
(3, 3, 6, 94, '2026-07-04'),
(4, 7, 2, 48, '2026-07-06'),
(5, 5, 4, 70, '2026-07-07'),
(7, 6, 3, 62, '2026-07-08'),
(8, 10, 1, 35, '2026-07-09'),
(9, 9, 2, 42, '2026-07-10');