USE ejercicio_12_int;

INSERT INTO usuarios (nombre, correo) VALUES
('Carlos Méndez', 'carlos.mendez@email.com'),
('Laura Gómez', 'laura.gomez@email.com'),
('Andrés Castillo', 'andres.castillo@email.com'),
('María Torres', 'maria.torres@email.com'),
('Daniel Herrera', 'daniel.herrera@email.com'),
('Sofía Morales', 'sofia.morales@email.com');

INSERT INTO artistas (nombre, pais_origen) VALUES
('Imagine Dragons', 'Estados Unidos'),
('Coldplay', 'Reino Unido'),
('The Weeknd', 'Canadá'),
('Dua Lipa', 'Reino Unido'),
('Linkin Park', 'Estados Unidos'),
('Bad Bunny', 'Puerto Rico');

INSERT INTO generos (nombre) VALUES
('Rock'),
('Pop'),
('Alternativo'),
('Hip Hop'),
('Electrónica'),
('Urbano');

INSERT INTO canciones (
    titulo,
    duracion_segundos,
    id_artista,
    id_genero
) VALUES
('Believer', 204, 1, 1),
('Viva La Vida', 242, 2, 2),
('Blinding Lights', 200, 3, 3),
('Levitating', 203, 4, 2),
('Numb', 185, 5, 1),
('Tití Me Preguntó', 243, 6, 6),
('Demons', 175, 1, 1),
('Paradise', 278, 2, 2),
('Save Your Tears', 215, 3, 3),
('New Rules', 209, 4, 2);

INSERT INTO playlists (
    nombre,
    descripcion,
    id_usuario,
    fecha_creacion
) VALUES
('Entrenamiento', 'Canciones para sesiones de entrenamiento', 1, '2026-01-10'),
('Viaje', 'Música para viajes largos', 2, '2026-01-15'),
('Favoritas', 'Selección personal de canciones favoritas', 3, '2026-02-01'),
('Noche', 'Playlist para escuchar durante la noche', 4, '2026-02-10'),
('Concentración', 'Música para estudiar y trabajar', 5, '2026-03-05'),
('Fin de semana', 'Canciones para disfrutar el fin de semana', 6, '2026-03-15');

INSERT INTO playlist_canciones (
    id_playlist,
    id_cancion,
    posicion,
    fecha_agregada
) VALUES
(1, 1, 1, '2026-01-10'),
(1, 5, 2, '2026-01-10'),
(1, 7, 3, '2026-01-11'),

(2, 2, 1, '2026-01-15'),
(2, 6, 2, '2026-01-16'),
(2, 8, 3, '2026-01-16'),

(3, 1, 1, '2026-02-01'),
(3, 3, 2, '2026-02-02'),
(3, 4, 3, '2026-02-02'),
(3, 9, 4, '2026-02-03'),

(4, 3, 1, '2026-02-10'),
(4, 4, 2, '2026-02-10'),
(4, 10, 3, '2026-02-11'),

(5, 2, 1, '2026-03-05'),
(5, 8, 2, '2026-03-05'),

(6, 6, 1, '2026-03-15'),
(6, 9, 2, '2026-03-15'),
(6, 10, 3, '2026-03-16');