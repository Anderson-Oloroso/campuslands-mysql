USE campuslands_mysql;

-- 0. Actualizaciones de datos (Sentencias UPDATE requeridas por el ejercicio)
-- Actualizar el estado de un jugador lesionado a activo
UPDATE jugadores_sala 
SET estado = 'activo' 
WHERE nombre = 'Adolfo Fernández';

-- Incrementar los goles de un jugador tras un partido
UPDATE jugadores_sala 
SET goles = goles + 2 
WHERE nombre = 'Falcão';

-- Sancionar a un jugador por acumulacion de tarjetas
UPDATE jugadores_sala 
SET estado = 'suspendido' 
WHERE tarjetas_amarillas >= 3 AND estado = 'activo';

-- 1. Listado general de jugadores ordenados por cantidad de goles descendente
SELECT nombre, posicion, goles, estado
FROM jugadores_sala
ORDER BY goles DESC;

-- 2. Conteo de jugadores agrupados por su estado actual
SELECT estado, COUNT(*) AS total_jugadores
FROM jugadores_sala
GROUP BY estado;

-- 3. Top 3 goleadores del campeonato
SELECT nombre, posicion, goles
FROM jugadores_sala
ORDER BY goles DESC
LIMIT 3;

-- 4. Promedio de goles de los jugadores activos
SELECT AVG(goles) AS promedio_goles_activos
FROM jugadores_sala
WHERE estado = 'activo';

-- 5. Jugadores activos o suspendidos con tarjetas amarillas registradas
SELECT nombre, posicion, tarjetas_amarillas, estado
FROM jugadores_sala
WHERE estado IN ('activo', 'suspendido') AND tarjetas_amarillas > 0
ORDER BY tarjetas_amarillas DESC;