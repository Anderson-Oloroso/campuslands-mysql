-- Ejercicio 015 (Intermedio) - carga de datos para biblioteca gamer
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Total de juegos cargados por plataforma
SELECT plataforma, COUNT(*) AS total_juegos
FROM coleccion_juegos
GROUP BY plataforma
ORDER BY total_juegos DESC;

-- 2. Juegos sin completar y sin horas jugadas (caso limite de la carga)
SELECT titulo, plataforma, fecha_adquisicion
FROM coleccion_juegos
WHERE horas_jugadas = 0;

-- 3. Resumen de completados cargado en resumen_completados_gamer
SELECT plataforma, total_completados, horas_totales
FROM resumen_completados_gamer
ORDER BY horas_totales DESC;

-- 4. Plataforma con mayor cantidad de horas jugadas en total
SELECT plataforma, SUM(horas_jugadas) AS horas_totales
FROM coleccion_juegos
GROUP BY plataforma
ORDER BY horas_totales DESC
LIMIT 1;

-- 5. Juegos adquiridos en el segundo trimestre de 2026
SELECT titulo, plataforma, fecha_adquisicion
FROM coleccion_juegos
WHERE fecha_adquisicion BETWEEN '2026-04-01' AND '2026-06-30'
ORDER BY fecha_adquisicion ASC;
