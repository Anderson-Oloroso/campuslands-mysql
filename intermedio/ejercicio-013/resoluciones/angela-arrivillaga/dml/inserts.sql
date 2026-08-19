USE peliculas_miedo_db;

INSERT INTO peliculas (codigo_pelicula, titulo, anio_estreno, duracion_minutos, calificacion_imdb, estado_pelicula) VALUES
('HOR-001', 'El Conjuro', 2013, 112, 7.5, 'streaming'),
('HOR-002', 'Hereditary', 2018, 127, 7.3, 'streaming'),
('HOR-003', 'El Exorcista', 1973, 122, 8.1, 'archivo'),
('HOR-004', 'La Cosa', 1982, 109, 8.2, 'archivo'),
('HOR-005', 'It Follows', 2014, 100, 6.8, 'streaming'),
('HOR-006', 'Scream: Grita antes de morir', 1996, 111, 7.4, 'cartelera'),
('HOR-007', 'El Resplandor', 1980, 144, 8.4, 'archivo'),
('HOR-008', 'Talk to Me', 2022, 95, 7.1, 'cartelera');

INSERT INTO categorias_terror (nombre_categoria, descripcion) VALUES
('Sobrenatural', 'Fantasmas, demonios, posesiones y entes de ultratumba'),
('Psicológico', 'Terror basado en la paranoia, locura y tensión mental'),
('Slasher', 'Asesinos seriales acechando victimas con armas blancas'),
('Sci-Fi Horror', 'Amenazas alienígenas, experimentos fallidos y monstruos cósmicos');

-- Relacionando peliculas con categorias mediante la tabla puente (N:M)
INSERT INTO pelicula_categoria (id_pelicula, id_categoria) VALUES
(1, 1), -- El Conjuro -> Sobrenatural
(1, 2), -- El Conjuro -> Psicológico
(2, 2), -- Hereditary -> Psicológico
(2, 1), -- Hereditary -> Sobrenatural
(3, 1), -- El Exorcista -> Sobrenatural
(4, 4), -- La Cosa -> Sci-Fi Horror
(5, 2), -- It Follows -> Psicológico
(6, 3), -- Scream -> Slasher
(7, 2), -- El Resplandor -> Psicológico
(8, 1), -- Talk to Me -> Sobrenatural
(8, 2); -- Talk to Me -> Psicológico