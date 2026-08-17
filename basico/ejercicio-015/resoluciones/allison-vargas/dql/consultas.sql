-- DQL: Consultas con relaciones (JOINs), filtros y agrupaciones
USE campuslands_mysql;

-- 1. Listado completo de juegos indicando el nombre de su plataforma y fabricante
SELECT 
    v.juego_id,
    v.titulo,
    p.nombre AS plataforma,
    p.fabricante,
    v.genero,
    v.precio_usd
FROM videojuegos v
INNER JOIN plataformas p ON v.plataforma_id = p.plataforma_id
ORDER BY p.nombre ASC, v.titulo ASC;

-- 2. Conteo de juegos y valor total de la biblioteca por plataforma
SELECT 
    p.nombre AS plataforma,
    COUNT(v.juego_id) AS total_juegos,
    SUM(v.precio_usd) AS inversion_total_usd,
    ROUND(AVG(v.precio_usd), 2) AS precio_promedio
FROM plataformas p
LEFT JOIN videojuegos v ON p.plataforma_id = v.plataforma_id
GROUP BY p.plataforma_id, p.nombre
ORDER BY total_juegos DESC;

-- 3. Top 3 de juegos con más tiempo invertido junto con el nombre de su plataforma
SELECT 
    v.titulo,
    p.nombre AS plataforma,
    v.horas_jugadas
FROM videojuegos v
INNER JOIN plataformas p ON v.plataforma_id = p.plataforma_id
ORDER BY v.horas_jugadas DESC
LIMIT 3;

-- 4. Juegos disponibles en plataformas de Sony o Nintendo
SELECT 
    v.titulo,
    p.nombre AS plataforma,
    p.fabricante,
    v.precio_usd
FROM videojuegos v
INNER JOIN plataformas p ON v.plataforma_id = p.plataforma_id
WHERE p.fabricante IN ('Sony', 'Nintendo')
ORDER BY v.precio_usd DESC;

-- 5. Total de horas jugadas por fabricante de consola/plataforma
SELECT 
    p.fabricante,
    SUM(v.horas_jugadas) AS total_horas_jugadas
FROM plataformas p
INNER JOIN videojuegos v ON p.plataforma_id = v.plataforma_id
GROUP BY p.fabricante
ORDER BY total_horas_jugadas DESC;
