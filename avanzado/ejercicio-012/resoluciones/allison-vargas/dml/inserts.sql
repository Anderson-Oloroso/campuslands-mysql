-- DML: Inserción de playlists y canciones con variaciones de métricas para pruebas de ventanas
USE campuslands_mysql;

INSERT INTO playlists (nombre_playlist, usuario_propietario, visibilidad) VALUES
('Top Hits Guatemala', 'Allison Vargas', 'publica'),
('Focus & Code Essentials', 'DevTeam', 'publica'),
('Chill & Synthwave', 'Allison Vargas', 'privada');

INSERT INTO canciones_playlist (playlist_id, titulo_cancion, artista, genero, duracion_segundos, reproducciones) VALUES
(1, 'Blinding Lights', 'The Weeknd', 'Synthpop', 200, 15000),
(1, 'As It Was', 'Harry Styles', 'Indie Pop', 167, 12000),
(1, 'Levitating', 'Dua Lipa', 'Pop', 203, 15000),
(1, 'Starboy', 'The Weeknd', 'R&B', 230, 9800),
(2, 'Midnight City', 'M83', 'Synthwave', 243, 8500),
(2, 'Resonance', 'HOME', 'Chillwave', 212, 11000),
(2, 'Tech Noir', 'GUNSHIP', 'Synthwave', 297, 6200),
(3, 'Nightcall', 'Kavinsky', 'Synthwave', 259, 14200),
(3, 'A Real Hero', 'College & Electric Youth', 'Indie', 267, 7300);
