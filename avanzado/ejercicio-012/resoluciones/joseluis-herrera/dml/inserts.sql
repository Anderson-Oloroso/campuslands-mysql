INSERT INTO usuarios (nombre, email, pais) VALUES
	('Ana Martinez', 'ana.martinez@email.com', 'Guatemala'),
	('Luis Hernandez', 'luis.h@email.com', 'Colombia'),
	('Maria Rodriguez', 'maria.r@email.com', 'Mexico'),
	('Kevin Castro', 'kevin.c@email.com', 'Guatemala'),
	('Sofia Morales', 'sofia.m@email.com', 'Argentina');

INSERT INTO playlists (usuario_id, titulo, visibilidad, fecha_creacion) VALUES
	(1, 'Rock Clasico 80s', 'Publica', '2026-01-15'),
	(1, 'Estudio & Focus', 'Privada', '2026-02-10'),
	(2, 'Gimnasio Motivacion', 'Publica', '2026-03-01'),
	(3, 'Exitos Pop 2026', 'Publica', '2026-04-12'),
	(4, 'Lofi Beats', 'Privada', '2026-05-20');

INSERT INTO canciones (playlist_id, titulo, artista, duracion_segundos) VALUES
	(1, 'Bohemian Rhapsody', 'Queen', 354),
	(1, 'Sweet Child O Mine', 'Guns N Roses', 356),
	(2, 'Weightless', 'Marconi Union', 480),
	(3, 'Eye of the Tiger', 'Survivor', 245),
	(4, 'Blinding Lights', 'The Weeknd', 200);