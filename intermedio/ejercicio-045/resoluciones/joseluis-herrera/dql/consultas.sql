USE campuslands_mysql;

SELECT
    titulo,
    genero,
    plataforma,
    precio,
    puntaje,
    estado
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY titulo;

SELECT
    titulo,
    genero,
    plataforma,
    precio,
    puntaje
FROM videojuegos
WHERE precio BETWEEN 30 AND 60
ORDER BY precio ASC;

SELECT
    genero,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(puntaje), 2) AS puntaje_promedio,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM videojuegos
GROUP BY genero
ORDER BY puntaje_promedio DESC;

SELECT
    titulo,
    genero,
    plataforma,
    puntaje
FROM videojuegos
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    plataforma,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM videojuegos
GROUP BY plataforma
ORDER BY total_videojuegos DESC;

SELECT
    titulo,
    genero,
    precio,
    puntaje
FROM videojuegos
WHERE puntaje >= 9.00
  AND precio < 50
ORDER BY puntaje DESC;

SELECT
    estado,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM videojuegos
GROUP BY estado
ORDER BY total_videojuegos DESC;