USE campuslands_mysql;

-- Inserts base que pediste + 5 registros más para el catálogo de miedo
INSERT INTO intermedio_ejercicio_013 (nombre, categoria, puntaje, estado) VALUES ('Alpha 013', 'Slasher', 63.50, 'activo'), ('Beta 013', 'Paranormal', 48.00, 'revision'), ('Gamma 013', 'Gore', 33.75, 'activo'), ('El Conjuro', 'Paranormal', 95.00, 'activo'), ('Halloween', 'Slasher', 88.50, 'activo'), ('Saw', 'Gore', 90.00, 'activo'), ('La Monja', 'Paranormal', 60.00, 'inactivo'), ('Scream', 'Slasher', 85.00, 'activo');

-- Insertamos las etiquetas de terror
INSERT INTO etiquetas_miedo (nombre_etiqueta) VALUES ('Fantasmas'), ('Sangre'), ('Asesino serial'), ('Misterio');

-- Llenamos la tabla puente conectando películas con múltiples etiquetas
INSERT INTO pelicula_etiqueta (id_pelicula, id_etiqueta) VALUES (1,3), (2,1), (3,2), (4,1), (4,4), (5,3), (6,2), (7,1), (8,3), (8,4);