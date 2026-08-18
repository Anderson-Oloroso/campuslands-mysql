INSERT INTO plataformas_gamer (nombre_plataforma, fabricante_empresa, generacion_consola) VALUES
('Steam (PC)', 'Valve Corporation', 9),
('PlayStation 5', 'Sony Interactive Entertainment', 9),
('Nintendo Switch', 'Nintendo', 8);

INSERT INTO desarrolladores_gamer (nombre_estudio, pais_origen, anio_fundacion) VALUES
('FromSoftware', 'Japón', 1986),
('CD Projekt Red', 'Polonia', 1994),
('Supergiant Games', 'Estados Unidos', 2009);

INSERT INTO videojuegos_gamer (desarrollador_id, titulo_juego, genero_principal, anio_lanzamiento, clasificacion_esrb) VALUES
(1, 'Elden Ring', 'Action RPG', 2022, 'M'),
(1, 'Sekiro: Shadows Die Twice', 'Action-Adventure', 2019, 'M'),
(2, 'The Witcher 3: Wild Hunt', 'Action RPG', 2015, 'M'),
(2, 'Cyberpunk 2077', 'Action RPG', 2020, 'M'),
(3, 'Hades', 'Roguelike', 2020, 'T');

INSERT INTO biblioteca_gamer (videojuego_id, plataforma_id, modalidad_adquisicion, precio_compra_usd, horas_jugadas, estado_juego, fecha_adquisicion) VALUES
(1, 1, 'Digital', 59.99, 145.5, 'Completado', '2026-01-10'),
(1, 2, 'Físico', 69.99, 20.0, 'Jugando', '2026-02-15'),
(2, 1, 'Digital', 29.99, 60.0, 'Completado', '2026-03-01'),
(3, 1, 'Digital', 14.99, 120.0, 'Completado', '2026-03-20'),
(4, 1, 'Digital', 29.99, 85.0, 'Jugando', '2026-04-05'),
(5, 3, 'Digital', 24.99, 45.0, 'Pendiente', '2026-05-12');