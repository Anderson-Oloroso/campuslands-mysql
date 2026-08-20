-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE playlist_musical_01;

INSERT INTO artistas_01 (nombre, genero) VALUES
('The Weeknd', 'Pop'),
('Dua Lipa', 'Pop'),
('Bad Bunny', 'Reggaeton'),
('Imagine Dragons', 'Rock'),
('Billie Eilish', 'Pop'),
('Ed Sheeran', 'Pop'),
('Post Malone', 'Hip Hop'),
('Harry Styles', 'Pop'),
('Karol G', 'Reggaeton'),
('Coldplay', 'Rock');

INSERT INTO canciones_playlist_01
(titulo, id_artista, album, anio_lanzamiento, duracion_segundos, reproducciones)
VALUES
('Blinding Lights', 1, 'After Hours', 2020, 200, 3500000),
('Levitating', 2, 'Future Nostalgia', 2020, 203, 2800000),
('Yonaguni', 3, 'Un Verano Sin Ti', 2022, 206, 3100000),
('Bones', 4, 'Mercury - Act 1', 2022, 165, 1900000),
('What Was I Made For?', 5, 'Barbie The Album', 2023, 222, 2500000),
('Eyes Closed', 6, 'Subtract', 2023, 194, 1700000),
('I Had Some Help', 7, 'F-1 Trillion', 2024, 178, 2200000),
('As It Was', 8, 'Harrys House', 2022, 167, 3300000),
('Si Antes Te Hubiera Conocido', 9, 'Mañana Será Bonito', 2024, 195, 2900000),
('Feelslikeimfallinginlove', 10, 'Moon Music', 2024, 238, 1600000);