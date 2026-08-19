use futbol_sala_db;

insert into posiciones (nombre_posicion, descripcion_rol) values
('arquero', 'defiende la porteria y lidera la salida de balon'),
('cierre', 'organizador defensivo y pilar en la retaguardia'),
('ala', 'jugador de bandas con recorrido ofensivo y defensivo'),
('pivot', 'referente de ataque, pivotea de espaldas al arco');

insert into jugadores_sala (nombre_completo, dorsal, id_posicion, goles_anotados, tarjetas_amarillas, salario_mensual, estado_jugador) values
('carlos mendoza', 1, 1, 1, 2, 1200.00, 'activo'),
('anderson vargas', 5, 2, 8, 3, 1500.00, 'activo'),
('allison pérez', 7, 3, 14, 1, 1800.00, 'activo'),
('cleidy gómez', 10, 3, 19, 4, 2100.00, 'suspendido'),
('iker dahinten', 9, 4, 22, 2, 2500.00, 'activo'),
('valeria rios', 8, 3, 6, 0, 1400.00, 'lesionado'),
('mateo lópez', 4, 2, 3, 5, 1300.00, 'suspendido'),
('sofia arriaga', 12, 1, 0, 1, 1100.00, 'activo');

-- práctica y aplicación de UPDATE para actualizar registros y simular eventos de temporada
update jugadores_sala
set goles_anotados = goles_anotados + 3, salario_mensual = salario_mensual + 150.00
where dorsal = 9;

update jugadores_sala
set estado_jugador = 'activo', tarjetas_amarillas = 0
where estado_jugador = 'suspendido' and dorsal = 4;

update jugadores_sala
set estado_jugador = 'lesionado'
where dorsal = 7 and estado_jugador = 'activo';