-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO peliculas
(titulo,director,estreno,estado)
VALUES
('El Conjuro','James Wan','2013-07-19','Disponible'),
('Insidious','James Wan','2010-09-14','Disponible'),
('It','Andy Muschietti','2017-09-08','Disponible'),
('Scream','Wes Craven','1996-12-20','Disponible'),
('Hereditary','Ari Aster','2018-06-08','Disponible'),
('The Nun','Corin Hardy','2018-09-07','No disponible'),
('Smile','Parker Finn','2022-09-30','Disponible'),
('Annabelle','John R. Leonetti','2014-10-03','Disponible');

INSERT INTO generos(nombre)
VALUES
('Terror'),
('Sobrenatural'),
('Slasher'),
('Suspenso'),
('Psicológico');

INSERT INTO peliculas_generos
VALUES
(1,1),
(1,2),
(2,1),
(2,2),
(3,1),
(4,3),
(5,5),
(6,2),
(7,4),
(8,2);