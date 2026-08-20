USE campuslands_mysql;

-- Limpieza de registros previos
TRUNCATE TABLE personajes_rpg;

-- Inserción de 8 personajes probando límites y casos normales
INSERT INTO personajes_rpg (codigo_personaje, nombre_personaje, clase_personaje, nivel_actual, puntos_vida, fuerza_ataque, estado_juego) VALUES
('RPG-001', 'Aragorn', 'Guerrero', 50, 1500.0, 250.5, 'activo'),
('RPG-002', 'Gandalf', 'Mago', 85, 800.0, 400.0, 'activo'),
('RPG-003', 'Legolas', 'Arquero', 45, 950.0, 300.2, 'activo'),
('RPG-004', 'Sauron', 'Mago', 99, 5000.0, 999.9, 'bloqueado'),
('RPG-005', 'Gimli', 'Guerrero', 40, 1800.0, 220.0, 'activo'),
('RPG-006', 'Elrond', 'Clerigo', 70, 1200.0, 150.0, 'activo'),
('RPG-007', 'Gollum', 'Asesino', 15, 300.0, 80.5, 'inactivo'),
('RPG-008', 'Galadriel', 'Clerigo', 90, 1100.0, 350.0, 'activo');