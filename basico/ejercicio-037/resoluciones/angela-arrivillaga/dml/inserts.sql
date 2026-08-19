use liga_futbol_db;

insert into ciudades (nombre_ciudad, pais) values
('madrid', 'españa'),
('barcelona', 'españa'),
('manchester', 'inglaterra'),
('munich', 'alemania'),
('turin', 'italia');

insert into equipos (nombre_equipo, id_ciudad, anio_fundacion, puntos, goles_a_favor, goles_en_contra, estado_equipo) values
('real madrid cf', 1, 1902, 78, 65, 22, 'activo'),
('fc barcelona', 2, 1899, 75, 70, 25, 'activo'),
('atletico de madrid', 1, 1903, 68, 52, 30, 'activo'),
('manchester city fc', 3, 1880, 82, 75, 20, 'activo'),
('manchester united fc', 3, 1878, 55, 45, 48, 'activo'),
('fc bayern munich', 4, 1900, 79, 78, 24, 'activo'),
('juventus fc', 5, 1897, 63, 48, 32, 'activo'),
('getafe cf', 1, 1983, 38, 31, 50, 'sancionado');