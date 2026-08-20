-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO Sagas (nombre_saga, creador, origen) VALUES
('Star Wars', 'George Lucas', 'Cine'),
('Dune', 'Frank Herbert', 'Literatura'),
('Matrix', 'Hermanas Wachowski', 'Cine'),
('Alien', 'Ridley Scott', 'Cine'),
('Terminator', 'James Cameron', 'Cine'),
('Star Trek', 'Gene Roddenberry', 'Television'),
('Back to the Future', 'Robert Zemeckis', 'Cine'),
('Planet of the Apes', 'Pierre Boulle', 'Literatura'),
('Blade Runner', 'Philip K. Dick', 'Literatura'),
('The Hunger Games', 'Suzanne Collins', 'Literatura');

INSERT INTO Peliculas (saga_id, titulo, anio_estreno, recaudacion_millones) VALUES
(1, 'Star Wars: A New Hope', 1977, 775.40),
(1, 'Star Wars: The Empire Strikes Back', 1980, 538.40),
(2, 'Dune: Part One', 2021, 402.00),
(2, 'Dune: Part Two', 2024, 711.80),
(3, 'The Matrix', 1999, 467.20),
(3, 'The Matrix Reloaded', 2003, 741.80),
(4, 'Alien', 1979, 106.30),
(4, 'Aliens', 1986, 131.10),
(5, 'The Terminator', 1984, 78.30),
(5, 'Terminator 2: Judgment Day', 1991, 520.90);