use campuslands_mysql;

-- insercion de categorias de carreras urbanas
insert into categorias_carrera (nombre_categoria, distancia_km, costo_inscripcion) values
('5k nocturna', 5.00, 25.00),
('10k express', 10.00, 35.00),
('media maraton urbana', 21.10, 55.00),
('maraton ciudad', 42.20, 80.00);

-- insercion de corredores registrados en las diferentes categorias
insert into corredores_urbanos (categoria_id, nombre_completo, edad, tiempo_llegada_minutos, estado_participacion) values
(1, 'carlos mendoza', 24, 21.50, 'completado'),
(1, 'sofia vargas', 22, 24.20, 'completado'),
(2, 'andres gomez', 28, 42.10, 'completado'),
(2, 'valeria perez', 30, 48.30, 'completado'),
(3, 'mateo silva', 35, 95.40, 'completado'),
(3, 'lucia rios', 27, null, 'retirado'),
(4, 'david morales', 40, 185.00, 'completado'),
(4, 'camila rojas', 29, null, 'inscrito');