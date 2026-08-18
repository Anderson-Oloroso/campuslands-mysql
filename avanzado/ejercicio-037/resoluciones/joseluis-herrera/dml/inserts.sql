USE campuslands_mysql;


INSERT INTO ligas (
    nombre,
    temporada,
    pais
) VALUES
    ('Liga Nacional', '2025-2026', 'España');


INSERT INTO equipos (
    nombre,
    ciudad
) VALUES
    ('Real Madrid', 'Madrid'),
    ('Barcelona', 'Barcelona'),
    ('Atletico de Madrid', 'Madrid'),
    ('Sevilla', 'Sevilla'),
    ('Valencia', 'Valencia'),
    ('Villarreal', 'Villarreal'),
    ('Real Sociedad', 'San Sebastian'),
    ('Athletic Club', 'Bilbao'),
    ('Real Betis', 'Sevilla'),
    ('Celta de Vigo', 'Vigo');


INSERT INTO participaciones (
    liga_id,
    equipo_id,
    partidos_jugados,
    partidos_ganados,
    partidos_empatados,
    partidos_perdidos,
    goles_favor,
    goles_contra,
    puntos
) VALUES
    (1, 1, 10, 8, 1, 1, 24, 8, 25),
    (1, 2, 10, 7, 2, 1, 22, 10, 23),
    (1, 3, 10, 6, 3, 1, 18, 9, 21),
    (1, 4, 10, 6, 1, 3, 17, 12, 19),
    (1, 5, 10, 5, 2, 3, 15, 13, 17),
    (1, 6, 10, 4, 3, 3, 16, 14, 15),
    (1, 7, 10, 4, 2, 4, 13, 14, 14),
    (1, 8, 10, 3, 3, 4, 12, 15, 12),
    (1, 9, 10, 3, 2, 5, 11, 16, 11),
    (1, 10, 10, 2, 3, 5, 10, 18, 9);