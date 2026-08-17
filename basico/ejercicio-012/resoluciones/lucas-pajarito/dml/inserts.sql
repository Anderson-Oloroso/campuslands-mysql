-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO artistas (id, nombre) VALUES
('artista1', 'Artista Uno'),
('artista2', 'Artista Dos'),
('artista3', 'Artista Tres');

INSERT INTO categorias_12 (id, nombre) VALUES
('cat1', 'Categoria Uno'),
('cat2', 'Categoria Dos'),
('cat3', 'Categoria Tres');

INSERT INTO basico_ejercicio_012 (nombre, id_categoria, tiempo_reproduccion, id_artista) VALUES
('Cancion A', 'cat1', 3.5, 'artista1'),
('Cancion B', 'cat2', 4.0, 'artista2'),
('Cancion C', 'cat3', 2.8, 'artista3'),
('Cancion D', 'cat1', 5.2, 'artista1'),
('Cancion E', 'cat2', 3.9, 'artista2');
