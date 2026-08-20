USE campuslands_mysql;

INSERT INTO equipos_liga (
    nombre,
    ciudad,
    partidos_jugados,
    partidos_ganados,
    partidos_empatados,
    partidos_perdidos,
    goles_favor,
    goles_contra,
    puntos
) VALUES
    ('Real Madrid', 'Madrid', 10, 8, 1, 1, 24, 8, 25),
    ('Barcelona', 'Barcelona', 10, 7, 2, 1, 22, 10, 23),
    ('Atletico de Madrid', 'Madrid', 10, 6, 3, 1, 18, 9, 21),
    ('Sevilla', 'Sevilla', 10, 6, 1, 3, 17, 12, 19),
    ('Valencia', 'Valencia', 10, 5, 2, 3, 15, 13, 17),
    ('Villarreal', 'Villarreal', 10, 4, 3, 3, 16, 14, 15),
    ('Real Sociedad', 'San Sebastian', 10, 4, 2, 4, 13, 14, 14),
    ('Athletic Club', 'Bilbao', 10, 3, 3, 4, 12, 15, 12),
    ('Real Betis', 'Sevilla', 10, 3, 2, 5, 11, 16, 11),
    ('Celta de Vigo', 'Vigo', 10, 2, 3, 5, 10, 18, 9);