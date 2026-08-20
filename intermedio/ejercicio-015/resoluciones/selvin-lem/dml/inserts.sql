-- Datos de practica: se combinan varias formas de carga de datos.
USE campuslands_mysql;

-- Carga multiple en un solo INSERT (forma mas eficiente para varias filas)
INSERT INTO videojuegos_biblioteca (titulo, plataforma, genero, horas_jugadas, fecha_compra, completado) VALUES
('Sendero Eterno', 'PC', 'rpg', 62.5, '2024-11-01', TRUE),
('Carrera Final', 'PS5', 'carreras', 18.0, '2024-11-05', FALSE),
('Fortaleza de Hierro', 'Xbox', 'estrategia', 40.2, '2024-11-10', TRUE),
('Mundo Fragmentado', 'PC', 'aventura', 25.7, '2024-11-15', FALSE);

-- Carga fila por fila, util cuando cada registro llega en momentos distintos
INSERT INTO videojuegos_biblioteca (titulo, plataforma, genero, horas_jugadas, fecha_compra, completado)
VALUES ('Legado Perdido', 'PS5', 'rpg', 55.3, '2024-11-20', TRUE);

INSERT INTO videojuegos_biblioteca (titulo, plataforma, genero, horas_jugadas, fecha_compra, completado)
VALUES ('Tactica Cero', 'Nintendo Switch', 'estrategia', 12.0, '2024-11-22', FALSE);

-- Carga usando valores por defecto (horas_jugadas y completado quedan en su DEFAULT)
INSERT INTO videojuegos_biblioteca (titulo, plataforma, genero, fecha_compra)
VALUES ('Recien Llegado', 'PC', 'plataformas', '2024-11-25');

-- Mas filas para completar el set de practica
INSERT INTO videojuegos_biblioteca (titulo, plataforma, genero, horas_jugadas, fecha_compra, completado) VALUES
('Reino de Cristal', 'Xbox', 'aventura', 33.4, '2024-11-27', TRUE),
('Duelo de Titanes', 'PS5', 'lucha', 20.1, '2024-11-29', FALSE),
('Isla Perdida', 'PC', 'supervivencia', 47.8, '2024-12-01', TRUE);

-- Nota: para cargas masivas desde archivo se usaria LOAD DATA INFILE,
-- por ejemplo (requiere permisos y ruta valida en el servidor):
-- LOAD DATA INFILE '/ruta/videojuegos.csv'
-- INTO TABLE videojuegos_biblioteca
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
