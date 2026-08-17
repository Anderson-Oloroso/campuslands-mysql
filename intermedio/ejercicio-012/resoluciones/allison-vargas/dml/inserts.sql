-- DML: Inserción de listas de reproducción y catálogo de canciones
USE campuslands_mysql;

INSERT INTO reportes_playlists (nombre_playlist, creador, tipo_acceso, fecha_creacion) VALUES
('Lo Mejor del Pop 2026', 'Allison Vargas', 'publica', '2026-01-15'),
('Coding & Dev Focus', 'DevTeam', 'publica', '2026-02-10'),
('Night Out Synth', 'Allison Vargas', 'privada', '2026-03-05');

INSERT INTO detalle_playlist_canciones (playlist_id, titulo_cancion, artista, genero, duracion_segundos, reproducciones) VALUES
(1, 'Blinding Lights', 'The Weeknd', 'Synthpop', 200, 15000),
(1, 'As It Was', 'Harry Styles', 'Indie Pop', 167, 12000),
(1, 'Levitating', 'Dua Lipa', 'Pop', 203, 14500),
(1, 'Starboy', 'The Weeknd', 'R&B', 230, 9800),
(2, 'Midnight City', 'M83', 'Synthwave', 243, 8500),
(2, 'Resonance', 'HOME', 'Chillwave', 212, 11000),
(2, 'Tech Noir', 'GUNSHIP', 'Synthwave', 297, 6200),
(3, 'Nightcall', 'Kavinsky', 'Synthwave', 259, 14200);
