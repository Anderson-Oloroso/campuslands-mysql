INSERT INTO usuarios_playlist (nombre_usuario, email, tipo_suscripcion, fecha_registro) VALUES
('carlos_rock', 'carlos.rock@email.com', 'Premium', '2026-01-10'),
('sofia_pop', 'sofia.pop@email.com', 'Gratuito', '2026-02-15'),
('mateo_beats', 'mateo.beats@email.com', 'Familiar', '2026-03-01');

INSERT INTO artistas_playlist (nombre_artista, genero_principal, pais_origen) VALUES
('Bohemia Suburbana', 'Rock', 'Guatemala'),
('Dua Lipa', 'Pop', 'Reino Unido'),
('Bad Bunny', 'Urbano', 'Puerto Rico'),
('Coldplay', 'Alternative', 'Reino Unido');

INSERT INTO canciones_playlist (artista_id, titulo_cancion, duracion_segundos, album, es_explicita) VALUES
(1, 'Peces e Iguanas', 285, 'Sombras en el Jardín', FALSE),
(1, 'Aire', 240, 'Remedios para el Alma', FALSE),
(2, 'Levitating', 203, 'Future Nostalgia', FALSE),
(2, 'Don\'t Start Now', 183, 'Future Nostalgia', FALSE),
(3, 'Monaco', 261, 'Nadie Sabe Lo Que Va a Pasar Mañana', TRUE),
(4, 'Yellow', 269, 'Parachutes', FALSE);

INSERT INTO playlists_musica (usuario_id, nombre_playlist, es_publica, fecha_creacion) VALUES
(1, 'Rock & Clasicos GT', TRUE, '2026-04-01'),
(1, 'Para Entrenar', TRUE, '2026-04-10'),
(2, 'Top Pop Hits', TRUE, '2026-05-01'),
(3, 'Mix Variado 2026', FALSE, '2026-06-15');

INSERT INTO elementos_playlist (playlist_id, cancion_id, orden_reproduccion, fecha_agregado) VALUES
(1, 1, 1, '2026-04-01 10:00:00'),
(1, 2, 2, '2026-04-01 10:05:00'),
(1, 6, 3, '2026-04-02 11:20:00'),
(2, 3, 1, '2026-04-10 15:30:00'),
(2, 5, 2, '2026-04-10 15:32:00'),
(3, 3, 1, '2026-05-01 08:00:00'),
(3, 4, 2, '2026-05-01 08:04:00'),
(4, 1, 1, '2026-06-15 20:00:00'),
(4, 5, 2, '2026-06-15 20:05:00'),
(4, 6, 3, '2026-06-15 20:10:00');