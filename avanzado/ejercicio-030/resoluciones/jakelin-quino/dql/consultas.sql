-- 1. Ver índices creados
SHOW INDEX FROM `ejercicio-030-adv-streamers`;

-- 2. EXPLAIN consulta con índice (plataforma)
EXPLAIN SELECT * FROM `ejercicio-030-adv-streamers` WHERE plataforma = 'Twitch';

-- 3. EXPLAIN consulta con índice (seguidores)
EXPLAIN SELECT nombre, seguidores FROM `ejercicio-030-adv-streamers` 
WHERE seguidores > 15000 ORDER BY seguidores DESC;