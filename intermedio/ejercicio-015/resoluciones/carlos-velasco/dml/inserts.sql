-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO videojuegos
(titulo,plataforma,genero,desarrollador,anio_lanzamiento,estado)
VALUES
('The Witcher 3','PC','RPG','CD Projekt Red',2015,'Disponible'),
('God of War Ragnarök','PlayStation','Acción','Santa Monica Studio',2022,'Prestado'),
('Halo Infinite','Xbox','Shooter','343 Industries',2021,'Disponible'),
('The Legend of Zelda: Tears of the Kingdom','Nintendo Switch','Aventura','Nintendo',2023,'Disponible'),
('Minecraft','PC','Sandbox','Mojang',2011,'Prestado'),
('Forza Horizon 5','Xbox','Carreras','Playground Games',2021,'Disponible'),
('Spider-Man 2','PlayStation','Acción','Insomniac Games',2023,'Mantenimiento'),
('Animal Crossing: New Horizons','Nintendo Switch','Simulación','Nintendo',2020,'Disponible');


INSERT INTO prestamos
(videojuego_id,usuario,fecha_prestamo,fecha_devolucion,estado)
VALUES
(2,'Carlos Méndez','2026-07-20',NULL,'Activo'),
(5,'Luis Gómez','2026-07-18',NULL,'Activo'),
(1,'María López','2026-06-01','2026-06-08','Devuelto'),
(6,'José Ramírez','2026-05-12','2026-05-19','Devuelto'),
(3,'Andrea Pérez','2026-04-15','2026-04-22','Devuelto'),
(8,'Kevin Morales','2026-03-10','2026-03-17','Devuelto'),
(4,'Ana Castillo','2026-02-05','2026-02-12','Devuelto'),
(7,'Pedro Hernández','2026-01-08','2026-01-15','Devuelto');