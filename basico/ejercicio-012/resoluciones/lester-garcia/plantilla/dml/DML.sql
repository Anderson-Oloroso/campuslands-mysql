USE playlist_musical;

INSERT INTO usuarios
(nombre, correo, pais, fecha_registro)
VALUES
('Carlos Méndez', 'carlos.mendez@email.com', 'Guatemala', '2025-01-10'),
('Ana López', 'ana.lopez@email.com', 'México', '2025-01-15'),
('Luis García', 'luis.garcia@email.com', 'Colombia', '2025-02-03'),
('María Torres', 'maria.torres@email.com', 'España', '2025-02-18'),
('Pedro Ramírez', 'pedro.ramirez@email.com', 'Argentina', '2025-03-05'),
('Sofía Herrera', 'sofia.herrera@email.com', 'Chile', '2025-03-21'),
('Miguel Castro', 'miguel.castro@email.com', 'Perú', '2025-04-10'),
('Laura Díaz', 'laura.diaz@email.com', 'Costa Rica', '2025-04-25'),
('Jorge Morales', 'jorge.morales@email.com', 'Honduras', '2025-05-08'),
('Valentina Ruiz', 'valentina.ruiz@email.com', 'El Salvador', '2025-05-20');

INSERT INTO artistas
(nombre_artistico, genero_musical, pais_origen)
VALUES
('Aurora Waves', 'Pop', 'Estados Unidos'),
('Neon Beats', 'Electronica', 'Alemania'),
('Luna Roja', 'Rock', 'España'),
('Urban Kings', 'Hip Hop', 'Colombia'),
('Sonic Dreams', 'Indie', 'Reino Unido'),
('Costa Norte', 'Reggaeton', 'Puerto Rico'),
('Midnight Echo', 'R&B', 'Canadá'),
('Fire Avenue', 'Rock', 'México'),
('Digital Soul', 'Electronica', 'Francia'),
('Golden Notes', 'Pop', 'Italia');

INSERT INTO canciones
(titulo, duracion_segundos, album, anio_lanzamiento, id_artista)
VALUES
('Electric Heart', 218, 'Future Lights', 2024, 1),
('Night Pulse', 245, 'Digital Nights', 2023, 2),
('Sombras del Sol', 231, 'Horizonte', 2022, 3),
('Ciudad de Fuego', 198, 'Urban Life', 2024, 4),
('Dream Again', 267, 'Lost Signals', 2021, 5),
('Bajo las Estrellas', 224, 'Costa Viva', 2023, 6),
('Midnight Love', 252, 'After Dark', 2022, 7),
('Breaking Roads', 239, 'New Direction', 2024, 8),
('Digital Rain', 276, 'Synthetic World', 2023, 9),
('Golden Memories', 210, 'Timeless', 2020, 10);

INSERT INTO playlists
(nombre, descripcion, fecha_creacion, publica, id_usuario)
VALUES
('Favoritas del Año', 'Canciones favoritas para escuchar durante el año', '2025-02-01', TRUE, 1),
('Entrenamiento', 'Musica para sesiones de entrenamiento', '2025-02-05', FALSE, 2),
('Viaje en Carretera', 'Canciones para viajes largos', '2025-02-12', TRUE, 3),
('Noche Tranquila', 'Musica relajante para la noche', '2025-02-20', FALSE, 4),
('Fiesta Weekend', 'Canciones para reuniones y fiestas', '2025-03-01', TRUE, 5),
('Concentracion', 'Musica para estudiar y trabajar', '2025-03-10', FALSE, 6),
('Rock Classics', 'Seleccion de canciones de rock', '2025-03-18', TRUE, 7),
('Electronica', 'Playlist de musica electronica', '2025-04-02', TRUE, 8),
('Romanticas', 'Canciones romanticas seleccionadas', '2025-04-15', FALSE, 9),
('Mix Personal', 'Coleccion personal de canciones', '2025-05-01', TRUE, 10);

INSERT INTO playlist_canciones
(id_playlist, id_cancion, posicion, fecha_agregada)
VALUES
(1, 1, 1, '2025-02-01'),
(1, 3, 2, '2025-02-01'),
(2, 2, 1, '2025-02-05'),
(2, 4, 2, '2025-02-05'),
(3, 5, 1, '2025-02-12'),
(3, 6, 2, '2025-02-12'),
(4, 7, 1, '2025-02-20'),
(4, 10, 2, '2025-02-20'),
(5, 4, 1, '2025-03-01'),
(5, 6, 2, '2025-03-01'),
(6, 5, 1, '2025-03-10'),
(6, 9, 2, '2025-03-10'),
(7, 3, 1, '2025-03-18'),
(7, 8, 2, '2025-03-18'),
(8, 2, 1, '2025-04-02'),
(8, 9, 2, '2025-04-02'),
(9, 7, 1, '2025-04-15'),
(9, 10, 2, '2025-04-15'),
(10, 1, 1, '2025-05-01'),
(10, 8, 2, '2025-05-01');