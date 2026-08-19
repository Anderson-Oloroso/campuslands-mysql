USE playlist_musical_db;

INSERT INTO generos_musicales (nombre_genero, descripcion_genero) VALUES
('Synthwave', 'Musica electronica instrumental inspirada en los anos 80 con sintetizadores retro'),
('Lo-Fi Hip Hop', 'Ritmos relajantes ideales para estudiar, concentrarse y descansar'),
('Cyberpunk Industrial', 'Sonidos pesados, futuristas y oscuros con alta energia'),
('Rock Alternativo', 'Guitarras distorsionadas, melancolia y energia juvenil');

INSERT INTO canciones_playlist (codigo_cancion, titulo_cancion, artista, id_genero, duracion_segundos, reproducciones, estado_cancion) VALUES
('TRK-001', 'Nightcall on the Highway', 'Kavinsky Tribute', 1, 255, 14200, 'favorita'),
('TRK-002', 'Coffee and Raindrops', 'Lo-Fi Panda', 2, 180, 8500, 'activa'),
('TRK-003', 'Neon District Overdrive', 'Jinx Cyber Sound', 3, 210, 23000, 'favorita'),
('TRK-004', 'Hollow Dreams in Monochrome', 'Pale Court', 4, 310, 5400, 'activa'),
('TRK-005', 'Sunset Horizon Runner', 'Retrowave Rider', 1, 240, 11200, 'activa'),
('TRK-006', 'Midnight Study Session', 'Lo-Fi Panda', 2, 195, 9600, 'favorita'),
('TRK-007', 'Glitch in the Matrix', 'Cyberpunk Industrial', 3, 275, 18900, 'activa'),
('TRK-008', 'Ghibli Nostalgia Lullaby', 'Anime Vibes', 4, 220, 6700, 'favorita');