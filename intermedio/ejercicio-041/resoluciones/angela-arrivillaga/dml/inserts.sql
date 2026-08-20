use campuslands_mysql;

-- insercion de registros en torneos de ping pong
insert into torneos_pingpong (nombre_torneo, tipo_superficie, premio_mayor) values
('open mundial tokio', 'interior', 25000.00,
('masters berlin', 'interior', 18000.00),
('copa latinoamericana', 'exterior', 10000.00),
('grand slam paris', 'interior', 30000.00);

-- insercion de registros en jugadores de ping pong
insert into jugadores_pingpong (torneo_id, nombre_jugador, ranking_mundial, sets_ganados, sets_perdidos, estado_jugador) values
(1, 'ma long', 1, 45, 12, 'activo'),
(1, 'fan zhendong', 2, 42, 15, 'activo'),
(2, 'truls moregardh', 5, 30, 20, 'activo'),
(2, 'hugo calderano', 6, 28, 22, 'activo'),
(3, 'timo boll', 12, 25, 18, 'activo'),
(3, 'dimitrij ovtcharov', 15, 20, 25, 'lesionado'),
(4, 'tomokazu harimoto', 4, 38, 16, 'activo'),
(4, 'felix lebrun', 8, 22, 24, 'eliminado');