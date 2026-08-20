INSERT INTO plataformas_juego (nombre_plataforma, empresa_creadora) VALUES
('Steam', 'Valve Corporation'),
('PlayStation 5', 'Sony Interactive Entertainment'),
('Xbox Series X', 'Microsoft'),
('Nintendo Switch', 'Nintendo');

INSERT INTO desarrolladores_videojuegos (nombre_estudio, pais_origen) VALUES
('FromSoftware', 'Japón'),
('CD Projekt Red', 'Polonia'),
('Rockstar Games', 'Estados Unidos'),
('Supergiant Games', 'Estados Unidos');

INSERT INTO videojuegos (desarrollador_id, titulo_juego, genero, anio_lanzamiento, precio_base_usd) VALUES
(1, 'Elden Ring', 'Action RPG', 2022, 59.99),
(1, 'Dark Souls III', 'Action RPG', 2016, 59.99),
(2, 'The Witcher 3: Wild Hunt', 'RPG', 2015, 39.99),
(2, 'Cyberpunk 2077', 'Action RPG', 2020, 59.99),
(3, 'Red Dead Redemption 2', 'Action Adventure', 2018, 59.99),
(4, 'Hades', 'Roguelike', 2020, 24.99);

INSERT INTO bibliotecas_usuarios (videojuego_id, plataforma_id, nombre_usuario, horas_jugadas, estado_completado, fecha_adquisicion) VALUES
(1, 1, 'edgar_gamer', 145.50, 'Completado', '2026-01-10'),
(3, 1, 'edgar_gamer', 210.00, 'Completado', '2026-01-12'),
(4, 2, 'edgar_gamer', 85.20, 'En Progreso', '2026-02-01'),
(5, 3, 'sofia_player', 120.00, 'En Progreso', '2026-01-15'),
(6, 4, 'sofia_player', 65.00, 'Completado', '2026-02-10'),
(2, 1, 'marcos_pro', 95.00, 'Completado', '2026-02-05');

INSERT INTO registros_sesiones_juego (biblioteca_id, duracion_minutos, logros_desbloqueados, fecha_sesion) VALUES
(1, 180, 3, '2026-02-01 14:00:00'),
(1, 240, 5, '2026-02-02 16:30:00'),
(3, 120, 1, '2026-02-03 20:00:00'),
(4, 90, 2, '2026-02-05 18:00:00'),
(5, 150, 4, '2026-02-11 15:00:00'),
(2, 200, 2, '2026-02-12 19:10:00');