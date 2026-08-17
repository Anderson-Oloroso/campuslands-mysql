-- Datos de practica: catalogo de skins de un shooter.
-- codigo_skin es la PRIMARY KEY (clave natural de catalogo).
USE campuslands_mysql;

INSERT INTO skins_basico (codigo_skin, nombre_skin, arma, rareza, precio, coleccion) VALUES
('AK47-001', 'Fuego Carmesi', 'AK-47', 'epico', 45.00, 'Coleccion Infierno'),
('AWP-001', 'Dragon Lore', 'AWP', 'legendario', 320.00, 'Coleccion Mitica'),
('M4A1-001', 'Sombra Urbana', 'M4A1', 'raro', 28.00, 'Coleccion Urbana'),
('GLK-001', 'Neon Fatal', 'Glock-18', 'poco_comun', 8.50, 'Coleccion Neon'),
('AK47-002', 'Grafiti Salvaje', 'AK-47', 'comun', 3.20, 'Coleccion Calle'),
('DE-001', 'Halcon Dorado', 'Desert Eagle', 'epico', 55.00, 'Coleccion Mitica'),
('AWP-002', 'Ondas de Choque', 'AWP', 'raro', 32.00, 'Coleccion Neon'),
('M4A4-001', 'Bosque Fantasma', 'M4A4', 'poco_comun', 12.00, 'Coleccion Urbana'),
('USP-001', 'Susurro Nocturno', 'USP-S', 'raro', 18.50, 'Coleccion Infierno');
