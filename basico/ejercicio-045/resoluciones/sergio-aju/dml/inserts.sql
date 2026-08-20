USE campuslands_mysql;

-- Inserción de registros de géneros de videojuegos
INSERT INTO generos_biblioteca (id, nombre_genero, descripcion) VALUES
(1, 'Acción / Shooter', 'Juegos centrados en combate rápido, uso de armas y puntería.'),
(2, 'RPG de Acción', 'Juegos de rol con progresión de personajes y exploración de mundo abierto.'),
(3, 'Estrategia', 'Juegos enfocados en gestión de recursos, táctica y planificación.'),
(4, 'Supervivencia', 'Juegos donde el jugador debe recolectar recursos para mantenerse con vida.');

-- Inserción de al menos 8 registros de videojuegos asociados mediante Clave Foránea
INSERT INTO videojuegos_biblioteca (codigo_juego, titulo, genero_id, precio, calificacion, fecha_lanzamiento, estado_biblioteca) VALUES
('GAME-001', 'Cyberpunk 2077', 2, 59.99, 8.8, '2020-12-10', 'completado'),
('GAME-002', 'Counter-Strike 2', 1, 0.00, 8.5, '2023-09-27', 'instalado'),
('GAME-003', 'Elden Ring', 2, 59.99, 9.5, '2022-02-25', 'completado'),
('GAME-004', 'Apex Legends', 1, 0.00, 8.2, '2019-02-04', 'instalado'),
('GAME-005', 'Civilization VI', 3, 29.99, 8.9, '2016-10-21', 'archivado'),
('GAME-006', 'Baldur Gate 3', 2, 69.99, 9.7, '2023-08-03', 'completado'),
('GAME-007', 'Rust', 4, 39.99, 7.8, '2018-02-08', 'pendiente_descarga'),
('GAME-008', 'Doom Eternal', 1, 39.99, 9.0, '2020-03-20', 'instalado');