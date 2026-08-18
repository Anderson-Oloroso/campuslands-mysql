USE campuslands_mysql;

INSERT INTO equipos (
    nombre_equipo,
    region,
    estado
) VALUES
('Titanes Gaming', 'LATAM', 'activo'),
('Dragones Rojos', 'LATAM', 'activo'),
('Nexus Warriors', 'Norteamerica', 'activo'),
('Shadow Wolves', 'Europa', 'activo'),
('Cyber Knights', 'Asia', 'activo');

INSERT INTO jugadores (
    id_equipo,
    nombre_jugador,
    rol,
    edad
) VALUES
(1, 'Ragnar', 'Top', 22),
(1, 'Kairo', 'Jungla', 24),
(2, 'Blaze', 'Mid', 21),
(2, 'Vortex', 'ADC', 23),
(3, 'Hunter', 'Jungla', 25),
(3, 'Nova', 'Support', 20),
(4, 'Specter', 'Mid', 27),
(4, 'Frost', 'Top', 22),
(5, 'Akira', 'ADC', 24),
(5, 'Zen', 'Support', 21);

INSERT INTO partidas (
    id_equipo_local,
    id_equipo_visitante,
    fecha_partida,
    ganador_id
) VALUES
(1, 2, '2026-06-10', 1),
(3, 4, '2026-06-11', 4),
(5, 1, '2026-06-12', 5),
(2, 3, '2026-06-13', 2),
(4, 5, '2026-06-14', 4),
(1, 3, '2026-06-15', 1);