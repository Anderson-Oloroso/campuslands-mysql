-- Ejercicio 015 - relaciones simples para biblioteca gamer
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Listado de juegos con el nombre de su desarrolladora
SELECT j.titulo, j.genero, d.nombre AS desarrolladora
FROM basico_ejercicio_015 j
INNER JOIN desarrolladoras_015 d ON j.desarrolladora_id = d.id
ORDER BY d.nombre, j.titulo;

-- 2. Total de horas jugadas por desarrolladora
SELECT d.nombre AS desarrolladora,
       SUM(j.horas_jugadas) AS total_horas
FROM basico_ejercicio_015 j
INNER JOIN desarrolladoras_015 d ON j.desarrolladora_id = d.id
GROUP BY d.nombre
ORDER BY total_horas DESC;

-- 3. Juegos completados, ordenados por horas jugadas descendente
SELECT j.titulo, d.nombre AS desarrolladora, j.horas_jugadas
FROM basico_ejercicio_015 j
INNER JOIN desarrolladoras_015 d ON j.desarrolladora_id = d.id
WHERE j.estado = 'completado'
ORDER BY j.horas_jugadas DESC;

-- 4. Conteo de juegos por estado
SELECT estado, COUNT(*) AS total
FROM basico_ejercicio_015
GROUP BY estado
ORDER BY total DESC;

-- 5. Desarrolladora con mas juegos en la biblioteca
SELECT d.nombre AS desarrolladora,
       COUNT(j.id) AS total_juegos
FROM desarrolladoras_015 d
INNER JOIN basico_ejercicio_015 j ON j.desarrolladora_id = d.id
GROUP BY d.nombre
ORDER BY total_juegos DESC
LIMIT 1;
