-- Datos de practica: streamers y transmisiones de un equipo de streaming.
USE campuslands_mysql;

INSERT INTO streamers_basico (nombre_canal, categoria_principal, seguidores) VALUES
('NightOwlGaming', 'juegos', 125000),
('PixelQueenArt', 'arte', 48000),
('ChillBeatsRadio', 'musica', 61000),
('CodeWithMaria', 'programacion', 32000);

INSERT INTO transmisiones_basico (id_streamer, titulo, duracion_min, espectadores_pico, fecha) VALUES
(1, 'Maraton de RPG - Parte 1', 180, 4200, '2026-01-05'),
(1, 'Torneo Comunitario', 150, 5100, '2026-01-20'),
(2, 'Pintando Personajes Fan Art', 120, 1800, '2026-01-08'),
(2, 'Speedpaint en Vivo', 90, 1500, '2026-02-01'),
(3, 'Sesion de Lofi para Estudiar', 200, 2200, '2026-01-12'),
(3, 'Especial de Vinilos Clasicos', 160, 1900, '2026-02-10'),
(4, 'Construyendo una API en Vivo', 140, 900, '2026-01-18'),
(4, 'Debug en Vivo: Errores Reales', 110, 780, '2026-02-15'),
(1, 'Reaccionando a Nuevos Lanzamientos', 100, 3600, '2026-03-01');
