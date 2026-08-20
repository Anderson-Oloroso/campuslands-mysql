-- Insercion de datos para videojuego RPG (ejercicio-026)
USE campuslands_mysql;

-- Insercion en clases_personaje_rpg
INSERT INTO clases_personaje_rpg (nombre_clase, atributo_principal, rol_combate) VALUES
('Paladin Sagrado', 'Fuerza', 'Tanque'),
('Archimago Elemental', 'Inteligencia', 'DPS Magico'),
('Asesino Sombrío', 'Destreza', 'DPS Fisico'),
('Clerigo de la Luz', 'Fe', 'Sanador/Support'),
('Berserker Barbaro', 'Fuerza', 'DPS Fisico'),
('Cazador de Bestias', 'Destreza', 'DPS Fisico');

-- Insercion en heroes_rpg
INSERT INTO heroes_rpg (nombre_heroe, id_clase, nivel, puntos_vida, puntos_mana, oro_acumulado, gremio) VALUES
('Uther the Valiant', 1, 85, 9500, 2400, 18500, 'Knights of the Round'),
('Arthurus Shieldheart', 1, 70, 7800, 1900, 12000, 'Iron Vow'),
('Jaina Proudstar', 2, 92, 4200, 12000, 35000, 'Kirin Tor Mages'),
('Kaelen Sunstrider', 2, 88, 3900, 11500, 29000, 'Kirin Tor Mages'),
('Shadowblade Valeera', 3, 90, 5100, 3100, 42000, 'Silent Daggers'),
('Ezio Darkstride', 3, 75, 4600, 2800, 16500, 'Silent Daggers'),
('Anduin Lightbringer', 4, 80, 5800, 8500, 14000, 'Holy Cathedral'),
('Grommash Bloodfury', 5, 95, 11500, 800, 21000, 'Warsong Clan'),
('Ragnar Axehowl', 5, 68, 8900, 600, 9500, 'Warsong Clan'),
('Rexxar Huntermoon', 6, 89, 6700, 3500, 25000, 'Wilderness Walkers'),
('Sylvanas Windrunner', 6, 94, 6900, 4200, 38000, 'Shadow Rangers'),
('Tirion Dawnseeker', 1, 99, 12000, 3500, 55000, 'Knights of the Round');

