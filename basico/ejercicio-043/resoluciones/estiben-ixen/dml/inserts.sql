-- Insercion de datos para catalogo de peliculas de miedo (ejercicio-043)
USE campuslands_mysql;

INSERT INTO peliculas_terror (titulo, id_director, subgenero, duracion_min, presupuesto_millones, taquilla_millones, clasificacion_edad, estreno_anio) VALUES
('El Conjuro', 1, 'Sobrenatural', 112, 20.00, 319.50, 'R', 2013),
('Insidious', 1, 'Sobrenatural', 103, 1.50, 100.10, 'PG-13', 2010),
('Hereditary', 2, 'Psicologico', 127, 10.00, 82.80, 'R', 2018),
('Midsommar', 2, 'Psicologico', 147, 9.00, 48.00, 'R', 2019),
('Get Out', 3, 'Psicologico', 104, 4.50, 255.40, 'R', 2017),
('Us', 3, 'Sobrenatural', 116, 20.00, 256.10, 'R', 2019),
('El Laberinto del Fauno', 4, 'Monstruos', 118, 19.00, 83.90, 'R', 2006),
('Crimson Peak', 4, 'Sobrenatural', 119, 55.00, 74.70, 'R', 2015),
('Hush', 5, 'Slasher', 81, 1.00, 12.00, 'R', 2016),
('Doctor Sleep', 5, 'Sobrenatural', 152, 45.00, 72.30, 'R', 2019),
('Halloween 1978', 6, 'Slasher', 91, 0.32, 70.00, 'R', 1978),
('The Thing 1982', 6, 'Monstruos', 109, 15.00, 19.60, 'R', 1982);
