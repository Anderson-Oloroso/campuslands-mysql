USE campuslands_mysql;

SELECT
    id_dibujo,
    titulo,
    artista,
    tecnica,
    categoria,
    precio
FROM dibujos
WHERE estado = 'disponible'
ORDER BY precio DESC;

SELECT
    tecnica,
    COUNT(*) AS total_dibujos,
    AVG(precio) AS precio_promedio
FROM dibujos
GROUP BY tecnica
ORDER BY total_dibujos DESC;

SELECT
    categoria,
    COUNT(*) AS total_dibujos,
    AVG(precio) AS precio_promedio
FROM dibujos
GROUP BY categoria
ORDER BY precio_promedio DESC;

SELECT
    artista,
    COUNT(*) AS total_dibujos,
    AVG(precio) AS precio_promedio
FROM dibujos
GROUP BY artista
ORDER BY total_dibujos DESC
LIMIT 5;

SELECT
    id_dibujo,
    titulo,
    artista,
    nivel_dificultad,
    precio,
    estado
FROM dibujos
WHERE nivel_dificultad = 'avanzado'
  AND precio > 300
ORDER BY precio DESC;