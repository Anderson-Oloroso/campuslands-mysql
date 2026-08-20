use pingpong_db;

insert into categorias_nivel (nombre_categoria, puntos_minimos_ranking) values
('principiante', 100),
('intermedio', 300),
('avanzado', 600),
('profesional', 1000);

insert into jugadores_pingpong (nombre_completo, id_categoria, partidos_ganados, partidos_perdidos, sets_a_favor, sets_en_contra, cuota_membresia, estado_jugador) values
('carlos mendoza', 1, 15, 5, 45, 20, 50.00, 'activo'),
('anderson vargas', 3, 28, 4, 88, 25, 85.00, 'activo'),
('allison pérez', 2, 20, 8, 65, 35, 70.00, 'activo'),
('cleidy gómez', 1, 8, 12, 30, 42, 50.00, 'lesionado'),
('iker dahinten', 4, 35, 2, 110, 18, 120.00, 'activo'),
('valeria rios', 2, 18, 10, 58, 40, 70.00, 'activo'),
('mateo lópez', 4, 30, 7, 95, 30, 120.00, 'retirado'),
('sofia arriaga', 3, 22, 9, 72, 38, 85.00, 'activo');