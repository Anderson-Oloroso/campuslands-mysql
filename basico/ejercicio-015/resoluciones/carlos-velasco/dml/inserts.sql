-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO categorias (nombre)
VALUES
('Acción'),
('Aventura'),
('RPG'),
('Estrategia');

INSERT INTO videojuegos
(titulo,desarrollador,plataforma,fecha_lanzamiento,estado,categoria_id)
VALUES
('The Legend of Zelda: Breath of the Wild','Nintendo','Nintendo Switch','2017-03-03','Disponible',2),
('Elden Ring','FromSoftware','PC','2022-02-25','Prestado',3),
('God of War Ragnarök','Santa Monica Studio','PlayStation 5','2022-11-09','Disponible',1),
('Age of Empires IV','Relic Entertainment','PC','2021-10-28','Disponible',4),
('Hollow Knight','Team Cherry','PC','2017-02-24','Prestado',2),
('Red Dead Redemption 2','Rockstar Games','PC','2019-11-05','Disponible',1),
('Baldur''s Gate 3','Larian Studios','PC','2023-08-03','Disponible',3),
('Civilization VI','Firaxis Games','PC','2016-10-21','Prestado',4);