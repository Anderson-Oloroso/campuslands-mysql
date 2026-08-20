-- Ejercicio 011 (Intermedio) - CHECK para pingpong
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Partidos jugados, ordenados por fecha
SELECT jugador_local, jugador_visitante, sets_local, sets_visitante, fecha_partido
FROM partidos_pingpong
WHERE estado = 'jugado'
ORDER BY fecha_partido ASC;

-- 2. Partidos ganados de forma contundente (5 sets a favor del local)
SELECT jugador_local, jugador_visitante, sets_local, sets_visitante
FROM partidos_pingpong
WHERE sets_local = 5;

-- 3. Promedio de sets anotados por el local y por el visitante
SELECT ROUND(AVG(sets_local), 2) AS promedio_sets_local,
       ROUND(AVG(sets_visitante), 2) AS promedio_sets_visitante
FROM partidos_pingpong;

-- 4. Partidos suspendidos
SELECT jugador_local, jugador_visitante, fecha_partido
FROM partidos_pingpong
WHERE estado = 'suspendido';

-- 5. Conteo de partidos por estado
SELECT estado, COUNT(*) AS total_partidos
FROM partidos_pingpong
GROUP BY estado
ORDER BY total_partidos DESC;
