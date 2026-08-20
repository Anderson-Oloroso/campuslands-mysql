USE ejercicio_15_int;

INSERT INTO usuarios (nombre, nickname, correo) VALUES
('Carlos Méndez', 'ShadowGT', 'carlos@bibliogamer.com'),
('Laura Gómez', 'LauGamer', 'laura@bibliogamer.com'),
('Andrés Castillo', 'DarkKnight', 'andres@bibliogamer.com'),
('María Torres', 'PixelQueen', 'maria@bibliogamer.com'),
('Daniel Herrera', 'DragonX', 'daniel@bibliogamer.com'),
('Sofía Morales', 'SofiPlay', 'sofia@bibliogamer.com');

INSERT INTO plataformas (nombre, fabricante
) VALUES
('PlayStation 5', 'Sony'),
('Xbox Series X', 'Microsoft'),
('Nintendo Switch', 'Nintendo'),
('PC', 'Microsoft'),
('PlayStation 4', 'Sony'),
('Xbox One', 'Microsoft');

INSERT INTO videojuegos ( titulo, genero, anio_lanzamiento, id_plataforma) VALUES
('Elden Ring', 'RPG', 2022, 1),
('Forza Horizon 5', 'Carreras', 2021, 2),
('The Legend of Zelda: Tears of the Kingdom', 'Aventura', 2023, 3),
('Counter-Strike 2', 'Shooter', 2023, 4),
('God of War Ragnarök', 'Acción', 2022, 5),
('Halo Infinite', 'Shooter', 2021, 6),
('Minecraft', 'Sandbox', 2011, 4),
('Super Mario Odyssey', 'Plataformas', 2017, 3),
('Gran Turismo 7', 'Carreras', 2022, 1),
('The Witcher 3', 'RPG', 2015, 5);

INSERT INTO prestamos (id_usuario, id_videojuego, fecha_prestamo, fecha_devolucion, estado
) VALUES
(1, 1, '2026-01-10', '2026-01-18', 'Devuelto'),
(2, 3, '2026-01-15', '2026-01-25', 'Devuelto'),
(3, 4, '2026-02-01', NULL, 'Activo'),
(4, 5, '2026-02-08', '2026-02-20', 'Devuelto'),
(5, 2, '2026-02-15', NULL, 'Atrasado'),
(6, 8, '2026-03-01', NULL, 'Activo'),
(1, 7, '2026-03-05', '2026-03-12', 'Devuelto'),
(2, 9, '2026-03-10', NULL, 'Activo'),
(3, 10, '2026-03-15', '2026-03-28', 'Devuelto'),
(4, 6, '2026-03-20', NULL, 'Atrasado');