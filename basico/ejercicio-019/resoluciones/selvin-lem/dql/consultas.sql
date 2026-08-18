-- Ejercicio 019 - INSERT para paracaidismo
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Saltos ordenados por altitud descendente
SELECT nombre_paracaidista, nivel, altitud_metros
FROM saltos_paracaidismo
ORDER BY altitud_metros DESC;

-- 2. Saltos sin costo (instructores)
SELECT nombre_paracaidista, nivel, fecha_salto
FROM saltos_paracaidismo
WHERE costo_salto = 0;

-- 3. Duracion de caida promedio por nivel
SELECT nivel,
       COUNT(*) AS total_saltos,
       ROUND(AVG(duracion_caida_segundos), 1) AS duracion_promedio_seg
FROM saltos_paracaidismo
GROUP BY nivel
ORDER BY duracion_promedio_seg DESC;

-- 4. Ingresos totales generados por los saltos (excluye instructores)
SELECT SUM(costo_salto) AS ingresos_totales
FROM saltos_paracaidismo
WHERE costo_salto > 0;

-- 5. Paracaidistas principiantes ordenados por fecha de salto
SELECT nombre_paracaidista, fecha_salto, costo_salto
FROM saltos_paracaidismo
WHERE nivel = 'principiante'
ORDER BY fecha_salto ASC;
