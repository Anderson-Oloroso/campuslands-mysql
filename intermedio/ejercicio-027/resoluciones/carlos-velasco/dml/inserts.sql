USE campuslands_mysql;

INSERT INTO personajes_aventura (
    nombre_personaje,
    clase,
    nivel,
    puntos_vida,
    ataque,
    defensa,
    misiones_completadas,
    monedas,
    estado
) VALUES
    ('Aldric', 'Guerrero', 72, 5200, 910, 850, 48, 3250.00, 'activo'),
    ('Lyria', 'Hechicera', 65, 3600, 980, 620, 41, 4100.00, 'activo'),
    ('Kael', 'Arquero', 58, 3900, 870, 690, 35, 2750.00, 'activo'),
    ('Seraphina', 'Paladina', 81, 6100, 940, 970, 56, 5200.00, 'activo'),
    ('Darius', 'Asesino', 69, 3400, 1020, 580, 44, 3650.00, 'activo'),
    ('Elena', 'Exploradora', 47, 3000, 720, 650, 27, 1850.00, 'activo'),
    ('Ragnar', 'Berserker', 91, 7200, 1150, 760, 63, 6800.00, 'activo'),
    ('Mira', 'Curandera', 39, 2500, 560, 540, 19, 1200.00, 'inactivo'),
    ('Orion', 'Guerrero', 53, 4300, 790, 780, 31, 2300.00, 'activo'),
    ('Nyx', 'Asesina', 76, 3700, 1080, 610, 51, 4550.00, 'inactivo');