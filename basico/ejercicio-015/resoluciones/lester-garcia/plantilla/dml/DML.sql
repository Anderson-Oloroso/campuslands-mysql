USE ejercicio_15;

INSERT INTO usuarios
(nombre, correo, fecha_registro)
VALUES
('Carlos Méndez', 'carlos.mendez@email.com', '2025-01-10'),
('Ana López', 'ana.lopez@email.com', '2025-01-15'),
('Luis García', 'luis.garcia@email.com', '2025-02-03'),
('María Torres', 'maria.torres@email.com', '2025-02-18'),
('Pedro Ramírez', 'pedro.ramirez@email.com', '2025-03-05'),
('Sofía Herrera', 'sofia.herrera@email.com', '2025-03-21'),
('Miguel Castro', 'miguel.castro@email.com', '2025-04-10'),
('Laura Díaz', 'laura.diaz@email.com', '2025-04-25'),
('Jorge Morales', 'jorge.morales@email.com', '2025-05-08'),
('Valentina Ruiz', 'valentina.ruiz@email.com', '2025-05-20');

INSERT INTO generos
(nombre)
VALUES
('Acción'),
('Aventura'),
('RPG'),
('Estrategia'),
('Deportes'),
('Terror'),
('Carreras'),
('Lucha'),
('Simulación'),
('Shooter');

INSERT INTO videojuegos
(titulo, plataforma, anio_lanzamiento, id_genero)
VALUES
('Elden Ring', 'PC', 2022, 3),
('The Legend of Zelda', 'Nintendo Switch', 2023, 2),
('God of War Ragnarök', 'PlayStation 5', 2022, 1),
('Forza Horizon 5', 'Xbox Series X', 2021, 7),
('FIFA 25', 'PlayStation 5', 2024, 5),
('Resident Evil 4', 'PC', 2023, 6),
('Street Fighter 6', 'PlayStation 5', 2023, 8),
('Civilization VI', 'PC', 2016, 4),
('The Sims 4', 'PC', 2014, 9),
('Call of Duty Black Ops 6', 'Xbox Series X', 2024, 10);

INSERT INTO prestamos
(id_usuario, id_videojuego, fecha_prestamo, fecha_devolucion, estado)
VALUES
(1, 1, '2025-06-01', '2025-06-10', 'Devuelto'),
(2, 2, '2025-06-03', '2025-06-12', 'Devuelto'),
(3, 3, '2025-06-05', NULL, 'Prestado'),
(4, 4, '2025-06-07', '2025-06-15', 'Devuelto'),
(5, 5, '2025-06-10', NULL, 'Prestado'),
(6, 6, '2025-06-12', '2025-06-20', 'Devuelto'),
(7, 7, '2025-06-15', NULL, 'Prestado'),
(8, 8, '2025-06-18', '2025-06-25', 'Devuelto'),
(9, 9, '2025-06-20', NULL, 'Prestado'),
(10, 10, '2025-06-22', '2025-06-30', 'Devuelto');