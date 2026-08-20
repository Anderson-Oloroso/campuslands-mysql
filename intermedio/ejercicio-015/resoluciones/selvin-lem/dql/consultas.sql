-- Consultas sobre la carga de datos en videojuegos_biblioteca.
USE campuslands_mysql;

-- 1. Listado completo ordenado por fecha de compra
SELECT * FROM videojuegos_biblioteca
ORDER BY fecha_compra;

-- 2. Verificar que los valores por defecto se aplicaron correctamente
SELECT titulo, horas_jugadas, completado
FROM videojuegos_biblioteca
WHERE titulo = 'Recien Llegado';

-- 3. Juegos completados con mas horas jugadas
SELECT titulo, plataforma, horas_jugadas
FROM videojuegos_biblioteca
WHERE completado = TRUE
ORDER BY horas_jugadas DESC;

-- 4. Total de horas jugadas y cantidad de juegos por plataforma
SELECT plataforma, COUNT(*) AS total_juegos, SUM(horas_jugadas) AS horas_totales
FROM videojuegos_biblioteca
GROUP BY plataforma
ORDER BY horas_totales DESC;

-- 5. Juegos sin completar, ordenados por fecha de compra mas antigua
SELECT titulo, plataforma, fecha_compra
FROM videojuegos_biblioteca
WHERE completado = FALSE
ORDER BY fecha_compra ASC;
