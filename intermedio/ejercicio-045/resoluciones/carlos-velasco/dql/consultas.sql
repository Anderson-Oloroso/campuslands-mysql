USE campuslands_mysql;

-- 1. Mostrar todos los videojuegos de la biblioteca.
SELECT
    id_videojuego,
    titulo,
    genero,
    plataforma,
    precio,
    puntuacion,
    estado
FROM videojuegos;


-- 2. Mostrar los videojuegos disponibles.
SELECT
    titulo,
    genero,
    plataforma,
    precio
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY titulo ASC;


-- 3. Mostrar los videojuegos con puntuacion igual o superior a 9.0.
SELECT
    titulo,
    genero,
    puntuacion
FROM videojuegos
WHERE puntuacion >= 9.0
ORDER BY puntuacion DESC;


-- 4. Contar videojuegos registrados por genero.
SELECT
    genero,
    COUNT(*) AS total_videojuegos
FROM videojuegos
GROUP BY genero
ORDER BY total_videojuegos DESC;


-- 5. Calcular el precio promedio por plataforma.
SELECT
    plataforma,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM videojuegos
GROUP BY plataforma
ORDER BY precio_promedio DESC;


-- 6. Mostrar los cinco videojuegos mejor puntuados.
SELECT
    titulo,
    genero,
    plataforma,
    puntuacion
FROM videojuegos
ORDER BY puntuacion DESC
LIMIT 5;