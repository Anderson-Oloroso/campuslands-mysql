USE campuslands_mysql;

INSERT INTO canciones_playlist (
    titulo,
    artista,
    album,
    genero,
    duracion_segundos,
    anio_lanzamiento,
    estado
) VALUES
    ('Blinding Lights', 'The Weeknd', 'After Hours', 'Pop', 200, 2020, 'activa'),
    ('As It Was', 'Harry Styles', 'Harrys House', 'Pop', 167, 2022, 'activa'),
    ('Lose Yourself', 'Eminem', '8 Mile', 'Hip Hop', 326, 2002, 'activa'),
    ('One More Time', 'Daft Punk', 'Discovery', 'Electronica', 320, 2000, 'activa'),
    ('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 'Rock', 355, 1975, 'activa'),
    ('Numb', 'Linkin Park', 'Meteora', 'Rock', 187, 2003, 'activa'),
    ('Shape of You', 'Ed Sheeran', 'Divide', 'Pop', 234, 2017, 'activa'),
    ('Get Lucky', 'Daft Punk', 'Random Access Memories', 'Electronica', 248, 2013, 'activa'),
    ('HUMBLE.', 'Kendrick Lamar', 'DAMN.', 'Hip Hop', 177, 2017, 'inactiva'),
    ('Dreams', 'Fleetwood Mac', 'Rumours', 'Rock', 257, 1977, 'activa');