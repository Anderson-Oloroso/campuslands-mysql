use torneo_moba_db;

insert into equipos_esports (codigo_equipo, nombre_equipo, region_origen, fundacion_anio) values
('EQ-01', 'nexus titans', 'norteamerica', 2018),
('EQ-02', 'shadow dragons', 'corea del sur', 2015),
('EQ-03', 'astral storm', 'europa', 2019),
('EQ-04', 'phantom legion', 'latinoamerica', 2021);

insert into jugadores_moba (alias_jugador, nombre_real, id_equipo, rol_principal, nivel_kda, estado_jugador) values
('jinx_main', 'angela arrivillaga', 1, 'tirador', 5.80, 'titular'),
('faker_fan', 'carlos perez', 2, 'carril central', 7.50, 'titular'),
('shadow_x', 'maria gomez', 3, 'jungla', 4.20, 'titular'),
('night_raven', 'anderson rodriguez', 4, 'carril superior', 3.90, 'titular'),
('akali_queen', 'allison vargas', 1, 'soporte', 6.10, 'titular'),
('yasuo_god', 'iker dahinten', 2, 'tirador', 2.10, 'suplente'),
('lux_light', 'cleidy martinez', 3, 'soporte', 5.00, 'titular'),
('viego_king', 'evelin suarez', 4, 'jungla', 4.80, 'titular');