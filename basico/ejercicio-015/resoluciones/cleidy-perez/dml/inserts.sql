-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE biblioteca_gamer_db;


INSERT INTO juegos (titulo, genero, plataforma, precio) VALUES
('The Witcher 3', 'RPG', 'PC', 39.99),
('Hades', 'Roguelike', 'PC', 24.99),
('Elden Ring', 'Soulslike', 'PlayStation', 59.99),
('Hollow Knight', 'Metroidvania', 'Switch', 14.99);

INSERT INTO biblioteca_usuario (nombre_usuario, id_juego, horas_jugadas, estado, fecha_adquisicion) VALUES
('GamerPro_99', 1, 120.5, 'Completado', '2025-01-15'),
('GamerPro_99', 3, 45.0, 'Jugando', '2025-06-10'),
('PixelQueen', 2, 80.2, 'Completado', '2025-03-22'),
('PixelQueen', 4, 5.5, 'Pendiente', '2026-02-01'),
('ShadowRider', 1, 12.0, 'Abandonado', '2025-11-05');