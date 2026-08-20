USE campuslands_mysql;

INSERT INTO personajes
    (
        nombre,
        clase,
        nivel,
        puntos_vida,
        poder_ataque,
        experiencia,
        estado
    )
VALUES
    ('Aren', 'Guerrero', 45, 3200, 850, 185000, 'activo'),
    ('Lyra', 'Exploradora', 38, 2400, 720, 142500, 'activo'),
    ('Kael', 'Cazador', 52, 2800, 910, 225000, 'activo'),
    ('Nora', 'Asesina', 61, 2300, 1100, 310000, 'activo'),
    ('Bran', 'Guerrero', 25, 1900, 520, 68000, 'inactivo'),
    ('Elena', 'Hechicera', 73, 3600, 1250, 425000, 'activo'),
    ('Riven', 'Asesino', 34, 2100, 780, 119000, 'activo'),
    ('Sylva', 'Exploradora', 47, 2600, 830, 198500, 'inactivo'),
    ('Dorian', 'Guerrero', 88, 5100, 1450, 720000, 'activo'),
    ('Mira', 'Hechicera', 15, 1200, 350, 24000, 'activo');