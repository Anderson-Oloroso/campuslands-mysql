USE db_kickboxing;

INSERT INTO peleadores (nombre, categoria, victorias, derrotas, estado) VALUES
('Superbon', 'Peso Pluma', 115, 35, 'Activo'),
('Giorgio Petrosyan', 'Peso Ligero', 104, 3, 'Retirado'),
('Tawanchai', 'Peso Pluma', 135, 31, 'Activo'),
('Rico Verhoeven', 'Peso Pesado', 64, 10, 'Activo'),
('Buakaw Banchamek', 'Peso Welter', 240, 24, 'Activo'),
('Jonathan Haggerty', 'Peso Gallo', 22, 4, 'Activo'),
('Roman Kryklia', 'Peso Semipesado', 49, 7, 'Activo'),
('Alex Pereira', 'Peso Mediano', 33, 7, 'Retirado');

DELETE FROM peleadores WHERE estado = 'Retirado' AND derrotas < 5;
DELETE FROM peleadores WHERE nombre = 'Alex Pereira';