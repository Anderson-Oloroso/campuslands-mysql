-- DML: Registro de películas y entregas de la saga de ciencia ficción
USE campuslands_mysql;

INSERT INTO entregas_scifi (titulo, director, fecha_estreno, presupuesto_usd, recaudacion_usd, clasificacion) VALUES
('Star Wars: Una Nueva Esperanza', 'George Lucas', '1977-05-25', 11000000.00, 775400000.00, 'PG'),
('Blade Runner', 'Ridley Scott', '1982-06-25', 28000000.00, 41700000.00, 'R'),
('Matrix', 'Lana y Lilly Wachowski', '1999-03-31', 63000000.00, 467200000.00, 'R'),
('Interstellar', 'Christopher Nolan', '2014-11-07', 165000000.00, 773400000.00, 'PG-13'),
('Dune: Parte Uno', 'Denis Villeneuve', '2021-10-22', 165000000.00, 402000000.00, 'PG-13'),
('Dune: Parte Dos', 'Denis Villeneuve', '2024-03-01', 190000000.00, 711800000.00, 'PG-13'),
('Avatar', 'James Cameron', '2009-12-18', 237000000.00, 2923700000.00, 'PG-13'),
('Terminator 2: El Juicio Final', 'James Cameron', '1991-07-03', 102000000.00, 520900000.00, 'R');
