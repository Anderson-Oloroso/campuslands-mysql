use campuslands_mysql;

-- insercion de registros en planetas
insert into planetas (nombre_planeta, tipo_clima, poblacion_estimada) values
('tatooine', 'arido', 200000),
('coruscant', 'urbano', 1000000000000),
('hoth', 'helado', 100),
('naboo', 'templado', 4500000000);

-- insercion de registros en personajes
insert into personajes (planeta_id, nombre_personaje, rol, nivel_poder, estado_personaje) values
(1, 'luke skywalker', 'jedi', 95, 'activo'),
(1, 'anakin skywalker', 'jedi', 98, 'desaparecido'),
(2, 'palpatine', 'sith', 100, 'inactivo'),
(2, 'padme amidala', 'lider', 40, 'inactivo'),
(3, 'han solo', 'piloto', 65, 'activo'),
(3, 'chewbacca', 'copiloto', 70, 'activo'),
(4, 'jar jar binks', 'diplomatico', 20, 'activo'),
(4, 'qui-gon jinn', 'jedi', 85, 'desaparecido');