USE playlist_musical_db;

INSERT INTO playlists (nombre, descripcion, creador, estado) VALUES
('Coding Vibe', 'Musica instrumental y lofi para programar de noche', 'Angela A.', 'activa'),
('Rock Clases', 'Los mejores exitos del rock de los 80s y 90s', 'Carlos V.', 'publica'),
('Workout Energy', 'Temas pesados de alta energia para entrenar', 'Mariana P.', 'activa'),
('Chill Ghibli', 'Melodias nostaljicas y relajantes', 'Sofia V.', 'archivada');

INSERT INTO canciones (titulo, artista, album, duracion_segundos) VALUES
('Resonance', 'HOME', 'Odyssey', 212),
('Midnight City', 'M83', 'Hurry Up, We\'re Dreaming', 244),
('Sweet Child O Mine', 'Guns N Roses', 'Appetite for Destruction', 356),
('Smells Like Teen Spirit', 'Nirvana', 'Nevermind', 301),
('Eye of the Tiger', 'Survivor', 'Eye of the Tiger', 245),
('The Way You Look Tonight', 'Frank Sinatra', 'Sinatra Sings', 202),
('One More Time', 'Daft Punk', 'Discovery', 320),
('Clair de Lune', 'Claude Debussy', 'Suite Bergamasque', 300);

INSERT INTO playlist_canciones (id_playlist, id_cancion, orden) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 2),
(3, 5, 1),
(3, 7, 2),
(4, 8, 1),
(1, 7, 3);