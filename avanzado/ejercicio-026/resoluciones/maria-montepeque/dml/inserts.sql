-- Datos de practica: arbol de habilidades de un videojuego RPG.
-- Se insertan primero las habilidades raiz (sin prerequisito) y luego
-- las dependientes, referenciando el id de su habilidad previa segun
-- el orden de insercion (AUTO_INCREMENT empieza en 1).
USE campuslands_mysql;

-- Raices (id 1 a 5): sin habilidad previa.
INSERT INTO habilidades_avanzado (nombre, clase, nivel_requerido, id_habilidad_previa) VALUES
('Golpe Basico', 'guerrero', 1, NULL),
('Bola de Fuego', 'mago', 1, NULL),
('Disparo Preciso', 'arquero', 1, NULL),
('Golpe Furtivo', 'picaro', 1, NULL),
('Curacion Menor', 'clerigo', 1, NULL);

-- Segundo nivel del arbol (id 6 a 9).
INSERT INTO habilidades_avanzado (nombre, clase, nivel_requerido, id_habilidad_previa) VALUES
('Golpe Poderoso', 'guerrero', 5, 1),
('Lluvia de Fuego', 'mago', 8, 2),
('Lluvia de Flechas', 'arquero', 7, 3),
('Curacion Mayor', 'clerigo', 12, 5);

-- Tercer nivel del arbol (id 10 y 11).
INSERT INTO habilidades_avanzado (nombre, clase, nivel_requerido, id_habilidad_previa) VALUES
('Grito de Guerra', 'guerrero', 10, 6),
('Meteoro', 'mago', 18, 7);

-- Cuarto nivel del arbol (id 12).
INSERT INTO habilidades_avanzado (nombre, clase, nivel_requerido, id_habilidad_previa) VALUES
('Furia Berserker', 'guerrero', 20, 10);
