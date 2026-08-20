-- Ejercicio 011 - validaciones simples para pingpong
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Promedio de puntaje y total de jugadores por categoria
SELECT categoria,
    COUNT(*) AS total_jugadores,
    ROUND(AVG(puntaje), 2) AS promedio_puntaje
FROM jugadores_pingpong
GROUP BY categoria
ORDER BY promedio_puntaje DESC;

-- 2. Top 5 jugadores por puntaje (ranking general)
SELECT nombre, categoria, puntaje
FROM jugadores_pingpong
ORDER BY puntaje DESC
LIMIT 5;

-- 3. Jugadores activos ordenados por puntaje descendente
SELECT nombre, categoria, puntaje, estado
FROM jugadores_pingpong
WHERE estado = 'activo'
ORDER BY puntaje DESC;

-- 4. Conteo de jugadores por estado
SELECT estado, COUNT(*) AS total
FROM jugadores_pingpong
GROUP BY estado
ORDER BY total DESC;

-- 5. Jugadores registrados en el segundo trimestre de 2026 (filtro por fecha)
SELECT nombre, categoria, fecha_registro
FROM jugadores_pingpong
WHERE fecha_registro BETWEEN '2026-04-01 00:00:00' AND '2026-06-30 23:59:59'
ORDER BY fecha_registro ASC;