-- Datos de practica. Puedes cambiarlos o agregar mas filas.

INSERT INTO artista (nombre, genero) VALUES
('Imagine Dragons', 'Rock'),
('The Weeknd', 'Pop'),
('Dua Lipa', 'Pop');

INSERT INTO cancion (titulo, duracion_segundos, id_artista) VALUES
('Believer', 204, 1),
('Blinding Lights', 200, 2),
('Levitating', 203, 3);

INSERT INTO playlist (nombre, descripcion) VALUES
('Playlist Favorita', 'Canciones favoritas para escuchar durante el dia');

INSERT INTO playlist_cancion (id_playlist, id_cancion, posicion) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3);