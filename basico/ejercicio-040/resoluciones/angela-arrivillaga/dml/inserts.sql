use carreras_urbanas_db;

insert into categorias_carrera (nombre_categoria, distancia_km) values
('5k recreativa', 5.00),
('10k urbana', 10.00),
('media maratón', 21.10),
('maratón completa', 42.20);

insert into corredores (nombre_completo, id_categoria, costo_inscripcion, tiempo_meta_minutos, estado_participacion) values
('carlos mendoza', 1, 25.00, 24, 'finalizado'),
('anderson vargas', 2, 40.00, 48, 'finalizado'),
('allison pérez', 3, 65.00, 110, 'finalizado'),
('cleidy gómez', 2, 40.00, 0, 'retirado'),
('iker dahinten', 4, 90.00, 215, 'finalizado'),
('valeria rios', 1, 25.00, 28, 'finalizado'),
('mateo lópez', 3, 65.00, 0, 'inscrito'),
('sofia arriaga', 4, 90.00, 240, 'finalizado');