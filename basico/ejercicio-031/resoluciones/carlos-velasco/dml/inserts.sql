USE campuslands_mysql;

INSERT INTO jugadores_moba (
    nombre_usuario,
    equipo,
    rol,
    victorias,
    derrotas,
    estado
) VALUES
    ('Ragnar', 'Titanes Gaming', 'Top', 18, 7, 'activo'),
    ('ShadowFox', 'Titanes Gaming', 'Jungla', 21, 5, 'activo'),
    ('Nexus', 'Titanes Gaming', 'Mid', 24, 4, 'activo'),
    ('Viper', 'Titanes Gaming', 'ADC', 20, 8, 'activo'),
    ('Oracle', 'Titanes Gaming', 'Support', 17, 9, 'activo'),
    ('Blaze', 'Dragon Force', 'Top', 15, 10, 'activo'),
    ('Kairo', 'Dragon Force', 'Jungla', 19, 8, 'activo'),
    ('Phantom', 'Dragon Force', 'Mid', 22, 6, 'activo'),
    ('Arrow', 'Dragon Force', 'ADC', 16, 11, 'activo'),
    ('Sage', 'Dragon Force', 'Support', 14, 12, 'activo'),
    ('Frost', 'Nova Esports', 'Mid', 13, 9, 'activo'),
    ('Rex', 'Nova Esports', 'ADC', 11, 13, 'inactivo');