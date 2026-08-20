-- =========================================================
-- 1. INSERTAR CATEGORÍAS
-- =========================================================

INSERT INTO categoria (nombre_categoria) VALUES
('Terror'),
('Suspenso'),
('Horror sobrenatural'),
('Slasher'),
('Terror psicológico'),
('Monstruos'),
('Zombis'),
('Gótico'),
('Paranormal'),
('Ciencia ficción de terror');


-- =========================================================
-- 2. INSERTAR DIRECTORES
-- =========================================================

INSERT INTO directores (nombre) VALUES
('James Wan'),
('Jordan Peele'),
('Ari Aster'),
('Robert Eggers'),
('Mike Flanagan'),
('John Krasinski'),
('Andy Muschietti'),
('David Robert Mitchell'),
('Sam Raimi'),
('Jennifer Kent');

INSERT INTO catalogo_peliculas
(titulo_pelicula, id_categoria, id_director, duracion_minutos, anio_publicacion)
VALUES
('El Conjuro', 1, 1, 112, '2020-07-15'),
('Nosotros', 2, 2, 116, '2020-03-22'),
('El Hombre Invisible', 3, 3, 125, '2021-02-26'),

('El Teléfono Negro', 1, 4, 103, '2021-10-12'),
('X', 4, 5, 105, '2022-03-18'),
('Men', 5, 6, 100, '2022-05-20'),

('La Noche del Demonio', 9, 1, 103, '2023-01-06'),
('La Monja II', 8, 7, 110, '2023-09-08'),
('Háblame', 3, 8, 95, '2023-07-28'),

('Un Lugar en Silencio', 6, 6, 90, '2024-03-27'),
('It: Capítulo Dos', 6, 7, 169, '2024-05-12'),
('El Babadook', 5, 10, 94, '2024-08-15'),

('Doctor Sueño', 8, 5, 152, '2025-01-10'),
('Posesión Infernal', 1, 9, 97, '2025-04-18'),
('Hereditary', 5, 3, 127, '2026-02-20');