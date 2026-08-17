-- Datos de practica: arbol de tecnicas de un club de pingpong.
-- Se insertan primero las tecnicas raiz (sin prerequisito) y luego las
-- dependientes, referenciando el id de su tecnica previa segun el
-- orden de insercion (AUTO_INCREMENT empieza en 1).
USE campuslands_mysql;

-- Raices (id 1 a 5): sin tecnica previa.
INSERT INTO tecnicas_pingpong_avanzado (nombre, categoria, nivel_requerido, id_tecnica_previa) VALUES
('Saque Corto', 'saque', 1, NULL),
('Golpe de Derecha Basico', 'ataque', 1, NULL),
('Golpe de Reves Basico', 'ataque', 1, NULL),
('Bloqueo Basico', 'defensa', 1, NULL),
('Efecto Basico', 'efecto', 1, NULL);

-- Segundo nivel del arbol (id 6 a 9).
INSERT INTO tecnicas_pingpong_avanzado (nombre, categoria, nivel_requerido, id_tecnica_previa) VALUES
('Topspin de Derecha', 'ataque', 5, 2),
('Saque con Efecto', 'saque', 8, 1),
('Contraataque', 'defensa', 7, 4),
('Efecto Lateral Avanzado', 'efecto', 12, 5);

-- Tercer nivel del arbol (id 10 y 11).
INSERT INTO tecnicas_pingpong_avanzado (nombre, categoria, nivel_requerido, id_tecnica_previa) VALUES
('Topspin Rematador', 'ataque', 10, 6),
('Saque Fantasma', 'saque', 18, 7);

-- Cuarto nivel del arbol (id 12).
INSERT INTO tecnicas_pingpong_avanzado (nombre, categoria, nivel_requerido, id_tecnica_previa) VALUES
('Golpe Definitivo', 'ataque', 20, 10);
