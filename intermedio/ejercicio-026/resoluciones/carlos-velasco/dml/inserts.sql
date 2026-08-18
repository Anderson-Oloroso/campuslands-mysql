USE campuslands_mysql;

INSERT INTO personajes_rpg (
    nombre_personaje,
    clase,
    nivel,
    puntos_vida,
    puntos_mana,
    fuerza,
    defensa,
    estado
) VALUES
    ('Arthas', 'Guerrero', 45, 3200, 450, 88, 92, 'activo'),
    ('Lyra', 'Maga', 38, 1800, 3200, 52, 65, 'activo'),
    ('Kael', 'Arquero', 52, 2400, 1200, 84, 70, 'activo'),
    ('Mira', 'Sacerdotisa', 31, 1700, 2900, 45, 68, 'activo'),
    ('Draven', 'Guerrero', 67, 4500, 700, 96, 94, 'activo'),
    ('Selene', 'Asesina', 55, 2600, 1400, 91, 73, 'activo'),
    ('Orin', 'Paladin', 42, 3600, 1800, 82, 89, 'activo'),
    ('Nyla', 'Maga', 24, 1300, 2500, 40, 55, 'inactivo'),
    ('Ragnar', 'Berserker', 73, 5200, 500, 99, 86, 'activo'),
    ('Elara', 'Druida', 29, 2100, 2700, 58, 62, 'inactivo');