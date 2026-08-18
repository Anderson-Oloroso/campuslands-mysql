USE campuslands_mysql;

SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
WHERE precio > (
    SELECT AVG(precio)
    FROM tatuajes
)
ORDER BY precio DESC;

SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
WHERE nombre_artista IN (
    SELECT nombre_artista
    FROM tatuajes
    GROUP BY nombre_artista
    HAVING COUNT(*) >= 2
)
ORDER BY nombre_artista, precio DESC;

SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes AS t
WHERE precio > (
    SELECT AVG(t2.precio)
    FROM tatuajes AS t2
    WHERE t2.estilo = t.estilo
)
ORDER BY estilo, precio DESC;

SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes AS t
WHERE EXISTS (
    SELECT 1
    FROM tatuajes AS t2
    WHERE t2.nombre_artista = t.nombre_artista
      AND t2.estado = 'completado'
)
ORDER BY nombre_artista, precio DESC;

SELECT
    nombre_cliente,
    estilo,
    precio,
    estado
FROM tatuajes
WHERE precio = (
    SELECT MAX(precio)
    FROM tatuajes
)
ORDER BY nombre_cliente;