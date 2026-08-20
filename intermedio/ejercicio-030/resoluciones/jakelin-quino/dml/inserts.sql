-- Carga de streamers
INSERT INTO `ejercicio-030-int-streamers` VALUES 
(1, 'Carlos', 'Twitch', 15000),
(2, 'María', 'YouTube', 20000),
(3, 'Juan', 'Twitch', 10000),
(4, 'Ana', 'Facebook', 8000);

-- Carga de equipos
INSERT INTO `ejercicio-030-int_equipos` (nombre, streamer_id, juego_principal) VALUES 
('Team Fury', 1, 'Fortnite'),
('Team Fury', 2, 'Valorant'),
('Team Fury', 3, 'League of Legends'),
('Team Fury', 4, 'Apex Legends');

-- Carga adicional (INSERT SELECT)
INSERT INTO `ejercicio-030-int_equipos` (nombre, streamer_id, juego_principal)
SELECT 'Team Fury', id, 'Minecraft' 
FROM `ejercicio-030-int-streamers` 
WHERE plataforma = 'Twitch';