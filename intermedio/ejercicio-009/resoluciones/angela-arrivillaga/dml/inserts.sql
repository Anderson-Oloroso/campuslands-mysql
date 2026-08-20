use campuslands_mysql;

insert into categorias_peso (nombre_categoria, limite_peso_kg) values
('peso mosca', 54.00),
('peso ligero', 70.00),
('peso welter', 77.00),
('peso semipesado', 88.50),
('peso pesado', 110.00);

insert into luchadores_kickboxing (nombre_completo, apodo, categoria_id, peleas_ganadas, peleas_perdidas, estado) values
('giorgio petrosyan', 'the doctor', 2, 102, 2, 'activo'),
('superbon singha mawynn', 'the high kick king', 2, 115, 35, 'activo'),
('rico verhoeven', 'the king of kickboxing', 5, 64, 10, 'activo'),
('artin kaysi', 'the iron', 3, 25, 4, 'activo'),
('alex pereira', 'poatan', 4, 33, 7, 'retirado'),
('buakaw banchamek', 'damka', 3, 240, 24, 'activo'),
('tahir meniz', 'the shadow', 1, 19, 2, 'lesionado'),
('Jonathan haggerty', 'the general', 1, 22, 4, 'activo');

insert into combates_kickboxing (luchador_azul_id, luchador_rojo_id, modalidad, ganador_id, fecha_combate) values
(1, 2, 'k1', 1, '2025-03-15'),
(3, 5, 'full contact', 3, '2025-05-20'),
(4, 6, 'low kick', 6, '2025-06-10'),
(7, 8, 'k1', 8, '2025-07-01'),
(2, 6, 'k1', 2, '2025-08-12'),
(1, 4, 'low kick', 1, '2025-09-05'),
(5, 3, 'full contact', null, '2025-10-22'),
(8, 7, 'k1', 8, '2025-11-18');