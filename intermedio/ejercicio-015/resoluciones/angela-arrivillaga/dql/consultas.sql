USE biblioteca_gamer_db;

-- 1. Reporte completo de la biblioteca gamer relacionando código, título, plataforma, precio, horas jugadas y estado actual
SELECT v.codigo_juego, v.titulo_juego, p.nombre_plataforma AS plataforma, CONCAT('$', FORMAT(v.precio, 2)) AS precio_usd, v.horas_jugadas, v.estado_juego
FROM videojuegos v
JOIN plataformas_gaming p ON v.id_plataforma = p.id_plataforma
ORDER BY v.horas_jugadas DESC;

-- 2. Reporte estadístico agrupado por plataforma gaming calculando el total de juegos, el valor total invertido y el promedio de horas jugadas
SELECT p.nombre_plataforma AS plataforma, p.fabricante, COUNT(v.id_videojuego) AS total_juegos, CONCAT('$', FORMAT(SUM(v.precio), 2)) AS inversion_total, ROUND(AVG(v.horas_jugadas), 1) AS promedio_horas
FROM plataformas_gaming p
LEFT JOIN videojuegos v ON p.id_plataforma = v.id_plataforma
GROUP BY p.id_plataforma, p.nombre_plataforma, p.fabricante
ORDER BY total_juegos DESC;

-- 3. Reporte filtrado de videojuegos con estado 'completado' o 'jugando' ordenados por mayor dedicación de tiempo
SELECT v.codigo_juego, v.titulo_juego, p.nombre_plataforma AS plataforma, v.horas_jugadas, v.estado_juego
FROM videojuegos v
JOIN plataformas_gaming p ON v.id_plataforma = p.id_plataforma
WHERE v.estado_juego IN ('completado', 'jugando')
ORDER BY v.horas_jugadas DESC;

-- 4. Top 5 de videojuegos con mayor inversión de tiempo (horas jugadas) en la biblioteca gamer
SELECT v.codigo_juego, v.titulo_juego, p.nombre_plataforma AS plataforma, v.horas_jugadas, v.estado_juego
FROM videojuegos v
JOIN plataformas_gaming p ON v.id_plataforma = p.id_plataforma
ORDER BY v.horas_jugadas DESC
LIMIT 5;

-- 5. Análisis de distribución por estado del videojuego evaluando cantidad de títulos, costo medio y horas acumuladas
SELECT v.estado_juego, COUNT(*) AS cantidad_juegos, CONCAT('$', FORMAT(AVG(v.precio), 2)) AS precio_promedio, SUM(v.horas_jugadas) AS horas_totales_acumuladas
FROM videojuegos v
GROUP BY v.estado_juego
ORDER BY cantidad_juegos DESC;