-- Insercion de datos para pingpong (ejercicio-041)
USE campuslands_mysql;

-- Insercion en clubes_pingpong
INSERT INTO clubes_pingpong (nombre, pais, categoria) VALUES
('Borussia Dusseldorf', 'Alemania', 'Profesional'),
('Shandong Weiqiao', 'China', 'Profesional'),
('Fakel Gazprom Orenburg', 'Rusia', 'Profesional'),
('AS Pontoise-Cergy', 'Francia', 'Profesional'),
('Kinoshita Tokyo', 'Japon', 'Profesional');

-- Insercion en jugadores_pingpong
INSERT INTO jugadores_pingpong (nombre, mano_habil, estilo_agarre, id_club, ranking_puntos, torneos_ganados, estado) VALUES
('Ma Long', 'Derecha', 'Shakehand', 2, 4200, 28, 'Activo'),
('Fan Zhendong', 'Derecha', 'Shakehand', 2, 4150, 24, 'Activo'),
('Timo Boll', 'Izquierda', 'Shakehand', 1, 3100, 19, 'Activo'),
('Dimitrij Ovtcharov', 'Derecha', 'Shakehand', 3, 2900, 15, 'Activo'),
('Tomokazu Harimoto', 'Derecha', 'Shakehand', 5, 3350, 12, 'Activo'),
('Wang Chuqin', 'Izquierda', 'Shakehand', 2, 3800, 16, 'Activo'),
('Lin Yun-Ju', 'Izquierda', 'Shakehand', 1, 2850, 10, 'Activo'),
('Hugo Calderano', 'Derecha', 'Shakehand', 3, 3050, 11, 'Activo'),
('Dang Qiu', 'Derecha', 'Penhold', 1, 2600, 8, 'Activo'),
('Felix Lebrun', 'Derecha', 'Penhold', 4, 3200, 9, 'Activo'),
('Alexis Lebrun', 'Derecha', 'Shakehand', 4, 2500, 7, 'Activo'),
('Truls Moregard', 'Derecha', 'Shakehand', 5, 2750, 6, 'Activo');

