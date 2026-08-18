-- Datos de practica. Puedes cambiarlos o agregar mas filas.

USE basico_biblioteca_gamer;

-- Carga de Categorías
INSERT INTO categoria_juegos_015 (nombre) VALUES
('RPG de Acción'),
('Estrategia en Tiempo Real'),
('Aventura Gráfica'),
('Simulación Espacial'),
('Shooter Táctico'),
('Plataformas 2D'),
('Supervivencia y Construcción'),
('Misterio y Terror');

-- Carga de Juegos
INSERT INTO juegos_015 (nombre, categoria_juego_015) VALUES
('Eldritch Chronicles', 1),
('Galactic Dominion', 2),
('Shadows of the Forgotten', 3),
('Astraea: Deep Space', 4),
('Vanguard Protocol', 5),
('Neon Jumpers', 6),
('Pixel Wilderness', 7),
('Whispers in the Dark', 8);

-- Carga de Creadores/Estudios
INSERT INTO creadores_015 (nombre) VALUES
('PixelForge Studios'),
('Aethermind Games'),
('Quantum Core Interactive'),
('Ironclad Software'),
('Starlight Interactive'),
('Velociraptor Games'),
('Hyperion Labs'),
('Midnight Code Co.');

-- Carga de Relaciones en Librería y Estadísticas de Descarga
INSERT INTO libreria_juegos_015 (id_juego, id_creador, cantidad_descargas) VALUES
(1, 1, 125000),
(2, 2, 89000),
(3, 3, 45000),
(4, 4, 310000),
(5, 5, 520000),
(6, 6, 18500),
(7, 7, 940000),
(8, 8, 67000);