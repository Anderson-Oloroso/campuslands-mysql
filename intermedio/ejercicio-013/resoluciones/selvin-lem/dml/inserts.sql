-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO peliculas_miedo (titulo, anio_estreno, duracion_min) VALUES
('La Casa Silenciosa', 2018, 95),
('El Sotano', 2020, 102),
('Vecinos Oscuros', 2016, 88),
('Ritual Nocturno', 2021, 110),
('El Espejo Roto', 2019, 97),
('Bosque sin Retorno', 2022, 105),
('La Ultima Llamada', 2017, 90),
('Sombras del Pasado', 2023, 99);

INSERT INTO generos_miedo (nombre) VALUES
('terror psicologico'),
('slasher'),
('sobrenatural'),
('found footage'),
('thriller');

-- Relacion muchos a muchos: una pelicula puede tener varios generos
INSERT INTO pelicula_genero (pelicula_id, genero_id) VALUES
(1, 1), (1, 3),
(2, 2), (2, 5),
(3, 3),
(4, 3), (4, 1),
(5, 1),
(6, 4), (6, 3),
(7, 2),
(8, 1), (8, 5);
