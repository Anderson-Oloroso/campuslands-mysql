USE campuslands_mysql;

INSERT INTO canciones (
    titulo,
    artista,
    genero,
    duracion_segundos,
    reproducciones,
    calificacion,
    estado
) VALUES
    ('Blinding Lights', 'The Weeknd', 'Pop', 200, 4200000, 4.8, 'activa'),
    ('As It Was', 'Harry Styles', 'Pop', 167, 3500000, 4.6, 'activa'),
    ('Levitating', 'Dua Lipa', 'Pop', 203, 3100000, 4.7, 'activa'),
    ('Lose Yourself', 'Eminem', 'Hip Hop', 326, 2800000, 4.9, 'activa'),
    ('HUMBLE.', 'Kendrick Lamar', 'Hip Hop', 177, 2400000, 4.8, 'activa'),
    ('Do I Wanna Know?', 'Arctic Monkeys', 'Rock', 272, 1900000, 4.7, 'activa'),
    ('Sweet Child O Mine', 'Guns N Roses', 'Rock', 356, 1700000, 4.9, 'activa'),
    ('One Dance', 'Drake', 'Hip Hop', 173, 2600000, 4.5, 'activa'),
    ('Take On Me', 'a-ha', 'Pop', 225, 1300000, 4.6, 'inactiva'),
    ('Hotel California', 'Eagles', 'Rock', 391, 1500000, 4.9, 'activa');