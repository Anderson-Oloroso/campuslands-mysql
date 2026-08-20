use futbol_sala_3fn_db;

insert into ciudades (nombre_ciudad, departamento_estado) values
('Bucaramanga', 'Santander'),
('Bogotá', 'Cundinamarca'),
('Medellín', 'Antioquia'),
('Cali', 'Valle del Cauca'),
('Barranquilla', 'Atlántico');

insert into sedes (nombre_sede, id_ciudad, capacidad) values
('Coliseo Bicentenario', 1, 7000),
('Coliseo El Salitre', 2, 5000),
('Coliseo Iván de Bedout', 3, 6000),
('Coliseo Evangelista Mora', 4, 4500),
('Coliseo Arena del Caribe', 5, 4000);

insert into equipos (nombre_equipo, id_sede_principal, fecha_fundacion) values
('Real Bucaramanga FS', 1, '2014-03-10'),
('Bogotá Futsal Club', 2, '2016-07-22'),
('Leones de Antioquia FS', 3, '2015-05-15'),
('Depor Cali Futsal', 4, '2017-02-18'),
('Junior Futsal', 5, '2018-09-05'),
('Academia Central FS', 2, '2020-01-12');

insert into categorias (nombre_categoria, descripcion) values
('Liga Profesional A', 'Categoria maxima de competicion de futbol sala profesional'),
('Torneo Sub-20', 'Categoria de formacion juvenil sub-20');

insert into partidos (id_categoria, id_equipo_local, id_equipo_visitante, id_sede, fecha_hora, goles_local, goles_visitante, estado_partido) values
(1, 1, 2, 1, '2026-03-01 19:00:00', 4, 2, 'finalizado'),
(1, 3, 4, 3, '2026-03-02 20:00:00', 3, 3, 'finalizado'),
(1, 5, 1, 5, '2026-03-08 18:30:00', 1, 5, 'finalizado'),
(1, 2, 3, 2, '2026-03-09 19:30:00', 2, 4, 'finalizado'),
(1, 4, 5, 4, '2026-03-15 20:00:00', 6, 2, 'finalizado'),
(1, 1, 3, 1, '2026-03-22 19:00:00', 3, 1, 'finalizado'),
(2, 6, 2, 2, '2026-04-01 15:00:00', 2, 2, 'programado'),
(2, 4, 1, 4, '2026-04-02 16:00:00', 0, 0, 'programado');

insert into jugadores (id_equipo, nombre_completo, posicion, dorsal, goles_anotados, tarjetas_amarillas, tarjetas_rojas) values
(1, 'Mateo Rodriguez', 'pivot', 10, 8, 1, 0),
(1, 'Santiago Gomez', 'ala', 7, 5, 2, 0),
(2, 'Alejandro Perez', 'cierre', 5, 2, 3, 1),
(2, 'Daniel Vargas', 'pivot', 9, 7, 0, 0),
(3, 'Felipe Restrepo', 'arquero', 1, 0, 1, 0),
(3, 'Camilo Osorio', 'ala', 11, 6, 2, 0),
(4, 'Esteban Marin', 'cierre', 4, 1, 4, 1),
(4, 'Julian Mejia', 'pivot', 8, 9, 1, 0),
(5, 'Kevin Torres', 'ala', 7, 4, 2, 0),
(6, 'Angela Arrivillaga', 'pivot', 10, 11, 0, 0);