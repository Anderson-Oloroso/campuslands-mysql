use videojuego_rpg_db;

insert into clases_personaje (nombre_clase, rol_principal) values
('guerrero', 'tanque'),
('mago elemental', 'daño magico'),
('asesino', 'daño critico'),
('clérigo', 'soporte y sanacion');

insert into facciones (nombre_faccion, alineacion) values
('orden del sol naciente', 'legal bueno'),
('legion de las sombras', 'neutral malvado'),
('gremio de mercenarios', 'neutral verdadero'),
('vigilantes del abismo', 'caotico bueno');

insert into personajes_rpg (codigo_personaje, nombre_personaje, id_clase, id_faccion, nivel, experiencia, puntos_vida, puntos_mana, estado_jugador) values
('PRJ-001', 'arthur pendragon', 1, 1, 85, 450000, 3500, 200, 'activo'),
('PRJ-002', 'merlin el sabio', 2, 1, 92, 580000, 1800, 4500, 'en_combate'),
('PRJ-003', 'valeria shadow', 3, 2, 78, 380000, 2200, 500, 'activo'),
('PRJ-004', 'elena de luz', 4, 4, 80, 410000, 2500, 3200, 'activo'),
('PRJ-005', 'gorn el destructor', 1, 3, 65, 250000, 4100, 100, 'en_combate'),
('PRJ-006', 'lyra frost', 2, 4, 70, 290000, 1600, 3800, 'inconciente'),
('PRJ-007', 'kael thas', 3, 2, 88, 510000, 2400, 600, 'activo'),
('PRJ-008', 'sarah white', 4, 1, 55, 180000, 2100, 2500, 'retirado');