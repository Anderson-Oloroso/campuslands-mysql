-- DML: Registro de canciones en la playlist con atributos detallados
USE campuslands_mysql;

INSERT INTO catalogo_canciones (titulo, artista, album, genero, duracion_segundos, reproducciones, estado, fecha_agregada) VALUES
('Blinding Lights', 'The Weeknd', 'After Hours', 'Synthpop', 200, 15000, 'disponible', '2026-01-10'),
('As It Was', 'Harry Styles', 'HARRY''S HOUSE', 'Indie Pop', 167, 12000, 'disponible', '2026-02-01'),
('Levitating', 'Dua Lipa', 'Future Nostalgia', 'Pop', 203, 14500, 'disponible', '2026-02-15'),
('Starboy', 'The Weeknd', 'Starboy', 'R&B', 230, 9800, 'disponible', '2026-03-01'),
('Midnight City', 'M83', 'Hurry Up, We''re Dreaming', 'Synthwave', 243, 8500, 'disponible', '2026-03-12'),
('Resonance', 'HOME', 'Odyssey', 'Chillwave', 212, 11000, 'disponible', '2026-04-05'),
('Tech Noir', 'GUNSHIP', 'GUNSHIP', 'Synthwave', 297, 6200, 'oculta', '2026-04-20'),
('Nightcall', 'Kavinsky', 'OutRun', 'Synthwave', 259, 14200, 'disponible', '2026-05-01');
