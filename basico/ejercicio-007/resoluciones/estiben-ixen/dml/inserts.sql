-- Insercion de datos para liga de futbol (ejercicio-007)
USE campuslands_mysql;

INSERT INTO futbolistas (nombre, posicion, numero_camiseta, id_club, goles, asistencias, salario_mensual, estado) VALUES
('Vinicius Junior', 'Delantero', 7, 1, 24, 11, 85000.00, 'Titular'),
('Jude Bellingham', 'Centrocampista', 5, 1, 21, 14, 80000.00, 'Titular'),
('Thibaut Courtois', 'Portero', 1, 1, 0, 0, 60000.00, 'Titular'),
('Robert Lewandowski', 'Delantero', 9, 2, 26, 8, 75000.00, 'Titular'),
('Pedri Gonzalez', 'Centrocampista', 8, 2, 6, 12, 55000.00, 'Titular'),
('Erling Haaland', 'Delantero', 9, 3, 31, 6, 95000.00, 'Titular'),
('Kevin De Bruyne', 'Centrocampista', 17, 3, 9, 18, 90000.00, 'Titular'),
('Harry Kane', 'Delantero', 9, 4, 29, 9, 88000.00, 'Titular'),
('Jamal Musiala', 'Centrocampista', 42, 4, 12, 10, 50000.00, 'Titular'),
('Lautaro Martinez', 'Delantero', 10, 5, 23, 7, 65000.00, 'Titular'),
('Kylian Mbappe', 'Delantero', 9, 1, 33, 10, 110000.00, 'Titular'),
('Lamine Yamal', 'Delantero', 19, 2, 14, 16, 45000.00, 'Titular');
=======
USE campuslands_mysql;

INSERT INTO equipos
(
nombre,
ciudad,
entrenador,
partidos_jugados,
puntos,
goles_favor,
goles_contra,
estado
)
VALUES

('Halcones FC','Guatemala','Carlos Méndez',20,48,52,18,'Activo'),

('Leones Unidos','Quetzaltenango','José Ramírez',20,42,45,23,'Activo'),

('Atlético Central','Escuintla','Luis Morales',20,36,39,30,'Activo'),

('Deportivo Norte','Petén','Mario López',20,28,31,33,'Activo'),

('Real Oriente','Zacapa','Fernando Ruiz',20,33,36,29,'Activo'),

('Titanes FC','Jutiapa','Andrés Castillo',20,51,60,20,'Activo'),

('Estrellas FC','Cobán','Miguel Pérez',20,24,25,40,'Suspendido'),

('Guerreros FC','Mazatenango','Jorge Díaz',20,40,43,27,'Activo'),

('Unión Deportiva','Retalhuleu','Kevin García',20,30,35,35,'Activo'),

('Club Victoria','Chiquimula','Ricardo Soto',20,18,20,48,'Suspendido');
