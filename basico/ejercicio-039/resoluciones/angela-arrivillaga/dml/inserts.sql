use kickboxing_db;

insert into categorias_peso (nombre_categoria, limite_peso_kg) values
('peso mosca', 57.00),
('peso ligero', 70.00),
('peso wélter', 79.00),
('peso mediano', 85.00),
('peso pesado', 120.00);

insert into luchadores (nombre_completo, id_categoria, peleas_ganadas, peleas_perdidas, nocauts_favor, cuota_mensual, estado_luchador) values
('carlos mendoza', 1, 12, 2, 5, 80.00, 'activo'),
('anderson vargas', 2, 18, 3, 9, 95.00, 'activo'),
('allison pérez', 3, 15, 1, 7, 110.00, 'activo'),
('cleidy gómez', 2, 4, 8, 1, 90.00, 'inactivo'),
('iker dahinten', 4, 22, 2, 14, 120.00, 'activo'),
('valeria rios', 1, 6, 5, 2, 80.00, 'inactivo'),
('mateo lópez', 5, 9, 10, 4, 130.00, 'retirado'),
('sofia arriaga', 3, 3, 7, 0, 100.00, 'inactivo');

-- práctica y aplicación de DELETE controlado para depurar registros inactivos o retirados con bajo rendimiento
delete from luchadores 
where estado_luchador = 'retirado' and peleas_ganadas < 10;

delete from luchadores 
where estado_luchador = 'inactivo' and peleas_ganadas < 5;