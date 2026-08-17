-- Datos de practica: usuarios y juegos de una biblioteca gamer.
USE campuslands_mysql;

INSERT INTO usuarios_basico (nombre_usuario, plataforma_principal, amigos) VALUES
('NightOwlGamer', 'pc', 68),
('PixelQueen', 'playstation', 42),
('RetroArcadeFan', 'switch', 55),
('CodeAndPlay', 'xbox', 21);

INSERT INTO juegos_basico (id_usuario, titulo, genero, horas_jugadas, precio) VALUES
(1, 'Sombras del Vacio', 'rpg', 120, 59.99),
(1, 'Torneo Comunitario FC', 'deportes', 45, 39.99),
(2, 'Pixel Legends', 'indie', 30, 14.99),
(2, 'Reinos en Guerra', 'estrategia', 80, 49.99),
(3, 'Arcade Rewind', 'accion', 60, 19.99),
(3, 'Carrera Retro 64', 'deportes', 25, 24.99),
(4, 'Codigo Fantasma', 'accion', 15, 29.99),
(4, 'Depuracion Extrema', 'indie', 10, 9.99),
(1, 'Reaccion en Cadena', 'accion', 70, 44.99);
