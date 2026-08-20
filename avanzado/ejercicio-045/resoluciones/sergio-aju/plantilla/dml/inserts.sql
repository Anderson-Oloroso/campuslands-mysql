USE campuslands_mysql;

-- Desactivar temporalmente restricciones de claves foráneas para limpieza y carga masiva ordenada
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE detalle_biblioteca_opt;
TRUNCATE TABLE plataformas_opt;
TRUNCATE TABLE generos_opt;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. Carga de Catálogo: Géneros
INSERT INTO generos_opt (id, nombre_genero, descripcion) VALUES
(1, 'Acción / Shooter', 'Juegos centrados en combate rápido, uso de armas y puntería.'),
(2, 'RPG de Acción', 'Juegos de rol con progresión de personajes y exploración de mundo abierto.'),
(3, 'Estrategia', 'Juegos enfocados en gestión de recursos, táctica y planificación.'),
(4, 'Supervivencia', 'Juegos donde el jugador debe recolectar recursos para mantenerse con vida.');

-- 2. Carga de Catálogo: Plataformas
INSERT INTO plataformas_opt (id, nombre_plataforma, tipo_sistema) VALUES
(1, 'Steam', 'PC'),
(2, 'Epic Games Store', 'PC'),
(3, 'PlayStation Network', 'Consola'),
(4, 'Xbox Game Pass', 'Consola / PC');

-- 3. Carga Masiva Optimizada de Videojuegos (10 registros de prueba)
INSERT INTO detalle_biblioteca_opt (codigo_juego, titulo, genero_id, plataforma_id, precio, calificacion, horas_jugadas, fecha_adquisicion, estado_biblioteca) VALUES
('GAME-001', 'Cyberpunk 2077', 2, 1, 59.99, 8.8, 120, '2025-11-15', 'completado'),
('GAME-002', 'Counter-Strike 2', 1, 1, 0.00, 8.5, 340, '2024-05-10', 'instalado'),
('GAME-003', 'Elden Ring', 2, 3, 59.99, 9.5, 185, '2023-02-20', 'completado'),
('GAME-004', 'Apex Legends', 1, 1, 0.00, 8.2, 95, '2024-01-12', 'instalado'),
('GAME-005', 'Civilization VI', 3, 2, 29.99, 8.9, 60, '2024-08-05', 'archivado'),
('GAME-006', 'Baldurs Gate 3', 2, 1, 69.99, 9.7, 210, '2023-09-01', 'completado'),
('GAME-007', 'Rust', 4, 1, 39.99, 7.8, 150, '2024-06-18', 'pendiente_descarga'),
('GAME-008', 'Doom Eternal', 1, 4, 39.99, 9.0, 45, '2024-10-22', 'instalado'),
('GAME-009', 'Hades II', 2, 1, 29.99, 9.3, 75, '2025-01-10', 'instalado'),
('GAME-010', 'The Witcher 3', 2, 3, 39.99, 9.6, 160, '2023-04-14', 'completado');