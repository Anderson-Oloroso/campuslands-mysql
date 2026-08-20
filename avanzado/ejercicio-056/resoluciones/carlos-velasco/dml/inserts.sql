USE campuslands_mysql;

INSERT INTO personajes_rpg
    (nombre, clase, nivel, experiencia, vida_maxima, mana_maximo, ataque, defensa, estado)
VALUES
    ('Arthas', 'paladin', 45, 125000, 4200, 1800, 520, 680, 'activo'),
    ('Lyra', 'mago', 38, 98500, 2400, 4200, 710, 290, 'activo'),
    ('Kael', 'arquero', 52, 168000, 3100, 1200, 760, 410, 'activo'),
    ('Ragnar', 'guerrero', 60, 225000, 5800, 900, 820, 750, 'activo'),
    ('Nyx', 'asesino', 47, 142000, 2800, 1400, 890, 350, 'activo'),
    ('Elara', 'mago', 25, 52000, 1800, 2800, 480, 210, 'activo'),
    ('Darius', 'guerrero', 33, 81000, 3600, 700, 590, 520, 'activo'),
    ('Sylva', 'arquero', 41, 115000, 2600, 1100, 680, 370, 'activo'),
    ('Mordek', 'asesino', 18, 27000, 1400, 600, 390, 180, 'inactivo'),
    ('Thalia', 'paladin', 55, 192000, 5100, 2100, 690, 720, 'activo'),
    ('Orion', 'guerrero', 72, 310000, 6900, 1000, 940, 860, 'activo'),
    ('Zarek', 'arquero', 29, 64000, 2100, 850, 530, 280, 'inactivo');