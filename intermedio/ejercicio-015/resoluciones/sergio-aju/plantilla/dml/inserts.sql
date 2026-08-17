-- Carga de datos para la biblioteca gamer.
USE campuslands_mysql;

-- Inserción múltiple de 10 registros variados para probar los casos
INSERT INTO ejercicio_015_biblioteca_gamer (titulo, genero, plataforma, precio, horas_jugadas, estado, fecha_adquisicion) VALUES
('The Legend of Zelda: Tears of the Kingdom', 'Aventura', 'Nintendo Switch', 69.99, 120, 'completado', '2023-05-12'),
('Cyberpunk 2077', 'RPG', 'PC', 59.99, 85, 'completado', '2020-12-10'),
('Hollow Knight', 'Metroidvania', 'PC', 14.99, 40, 'completado', '2021-06-15'),
('Elden Ring', 'RPG', 'PS5', 59.99, 150, 'jugando', '2022-02-25'),
('Stardew Valley', 'Simulación', 'PC', 14.99, 300, 'jugando', '2019-03-10'),
('Red Dead Redemption 2', 'Aventura', 'PS5', 39.99, 10, 'pendiente', '2023-11-20'),
('Overwatch 2', 'Shooter', 'PC', 0.00, 200, 'jugando', '2022-10-04'),
('God of War Ragnarok', 'Acción', 'PS5', 69.99, 45, 'completado', '2022-11-09'),
('Super Mario Bros. Wonder', 'Plataformas', 'Nintendo Switch', 59.99, 5, 'abandonado', '2023-10-20'),
('Baldur''s Gate 3', 'RPG', 'PC', 59.99, 0, 'pendiente', '2024-01-15');