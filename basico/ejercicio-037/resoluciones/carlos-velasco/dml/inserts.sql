USE campuslands_mysql;

INSERT INTO equipos_futbol (
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
    ('Halcones FC', 'Ciudad de Guatemala', 10, 8, 1, 1, 24, 8, 25),
    ('Tigres United', 'Quetzaltenango', 10, 7, 2, 1, 21, 10, 23),
    ('Leones FC', 'Escuintla', 10, 6, 2, 2, 19, 11, 20),
    ('Toros del Sur', 'Antigua Guatemala', 10, 5, 3, 2, 17, 12, 18),
    ('Aguilas Doradas', 'Mixco', 10, 5, 2, 3, 16, 13, 17),
    ('Pumas FC', 'Villa Nueva', 10, 4, 3, 3, 14, 13, 15),
    ('Lobos Rojos', 'Cobán', 10, 4, 1, 5, 13, 16, 13),
    ('Cometas FC', 'Puerto Barrios', 10, 3, 2, 5, 11, 17, 11),
    ('Dragones FC', 'Chimaltenango', 10, 2, 2, 6, 9, 18, 8),
    ('Centellas FC', 'Jalapa', 10, 1, 0, 9, 7, 25, 3);