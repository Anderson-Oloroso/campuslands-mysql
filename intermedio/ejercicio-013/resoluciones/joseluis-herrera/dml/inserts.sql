USE campuslands_mysql;

INSERT INTO peliculas
(titulo, categoria, anio, puntaje, estado)
VALUES
('El Conjuro', 'Sobrenatural', 2013, 8.5, 'activo'),
('Insidious', 'Sobrenatural', 2010, 8.1, 'activo'),
('Scream', 'Slasher', 1996, 7.9, 'activo'),
('Halloween', 'Slasher', 1978, 8.3, 'activo'),
('Hereditary', 'Psicologico', 2018, 8.7, 'activo'),
('The Ring', 'Sobrenatural', 2002, 7.8, 'inactivo'),
('Saw', 'Gore', 2004, 7.6, 'activo'),
('It Follows', 'Psicologico', 2014, 7.5, 'inactivo'),
('Midsommar', 'Psicologico', 2019, 8.2, 'activo'),
('Terrifier', 'Slasher', 2016, 6.9, 'inactivo');

INSERT INTO actores
(nombre)
VALUES
('Vera Farmiga'),
('Patrick Wilson'),
('Lin Shaye'),
('Neve Campbell'),
('Courteney Cox'),
('Jamie Lee Curtis'),
('Toni Collette'),
('Leigh Whannell'),
('Naomi Watts'),
('Tobin Bell'),
('Maika Monroe'),
('Florence Pugh');

INSERT INTO pelicula_actor
(pelicula_id, actor_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(5, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(10, 10);

INSERT INTO pelicula_actor
(pelicula_id, actor_id)
VALUES
(3, 10);