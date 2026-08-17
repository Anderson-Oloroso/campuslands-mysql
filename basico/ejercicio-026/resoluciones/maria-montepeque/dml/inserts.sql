-- Datos de practica: personajes de un videojuego RPG.
USE campuslands_mysql;

INSERT INTO personajes_basico (nombre, clase, nivel, vida_maxima, oro, estado) VALUES
('Aldric', 'guerrero', 25, 320, 450, 'activo'),
('Miriel', 'mago', 18, 180, 620, 'activo'),
('Kestrel', 'arquero', 22, 240, 380, 'activo'),
('Vex', 'picaro', 15, 200, 900, 'activo'),
('Selene', 'clerigo', 20, 260, 300, 'activo'),
('Boros', 'guerrero', 40, 450, 150, 'retirado'),
('Ithil', 'mago', 30, 220, 500, 'activo'),
('Draven', 'picaro', 12, 170, 1200, 'activo'),
('Tamsin', 'clerigo', 8, 190, 90, 'activo');
