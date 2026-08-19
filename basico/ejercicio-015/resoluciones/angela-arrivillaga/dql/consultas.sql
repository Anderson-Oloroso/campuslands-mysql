USE biblioteca_gamer_db;

-- 1. Listado completo de videojuegos con su respectiva plataforma, fabricante y precio ordenados por titulo
v.titulo, p.nombre_plataforma AS plataforma, p.fabricante, v.genero, v.precio, v.estado_inventario
FROM videojuegos v
JOIN plataformas p ON v.id_plataforma = p.id_plataforma
ORDER BY v.titulo ASC;

-- 2. Conteo y promedio de precios de videojuegos agrupados por plataforma
SELECT p.nombre_plataforma AS plataforma, COUNT(v.id_juego) AS total_juegos, ROUND(AVG(v.precio), 2) AS precio_promedio
FROM plataformas p
LEFT JOIN videojuegos v ON p.id_plataforma = v.id_plataforma
GROUP BY p.id_plataforma, p.nombre_plataforma
ORDER BY total_juegos DESC;

-- 3. Videojuegos que se encuentran actualmente disponibles en inventario ordenados por precio descendente
v.titulo, p.nombre_plataforma AS plataforma, v.precio, v.estado_inventario
FROM videojuegos v
JOIN plataformas p ON v.id_plataforma = p.id_plataforma
WHERE v.estado_inventario = 'disponible'
ORDER BY v.precio DESC;

-- 4. Top 5 de videojuegos mas costosos dentro de toda la biblioteca gamer
SELECT v.titulo, p.nombre_plataforma AS plataforma, v.precio, v.genero
FROM videojuegos v
JOIN plataformas p ON v.id_plataforma = p.id_plataforma
ORDER BY v.precio DESC
LIMIT 5;

-- 5. Resumen agrupado por estado de inventario para control administrativo
SELECT estado_inventario, COUNT(*) AS cantidad_titulos, ROUND(SUM(precio), 2) AS valor_total_inventario
FROM videojuegos
GROUP BY estado_inventario
ORDER BY cantidad_titulos DESC;