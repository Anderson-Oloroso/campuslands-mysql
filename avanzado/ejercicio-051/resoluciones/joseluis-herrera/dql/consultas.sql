USE campuslands_mysql;

SELECT
    estado,
    COUNT(*) AS total_dibujos,
    AVG(precio) AS precio_promedio
FROM dibujos
GROUP BY estado
ORDER BY total_dibujos DESC;

SELECT
    artista,
    COUNT(*) AS total_dibujos,
    AVG(precio) AS precio_promedio
FROM dibujos
WHERE estado = 'disponible'
GROUP BY artista
ORDER BY precio_promedio DESC;

SELECT
    titulo,
    artista,
    categoria,
    precio,
    estado
FROM dibujos
WHERE estado = 'disponible'
  AND precio >= 250
ORDER BY precio DESC;

SELECT
    titulo,
    artista,
    tecnica,
    precio
FROM dibujos
WHERE artista = 'Laura Gomez'
  AND estado = 'disponible'
ORDER BY precio DESC;

SELECT
    titulo,
    artista,
    nivel_dificultad,
    precio
FROM dibujos
WHERE precio BETWEEN 200 AND 500
ORDER BY precio DESC;

EXPLAIN
SELECT
    titulo,
    artista,
    categoria,
    precio,
    estado
FROM dibujos
WHERE estado = 'disponible'
  AND precio >= 250
ORDER BY precio DESC;

EXPLAIN
SELECT
    titulo,
    artista,
    tecnica,
    precio
FROM dibujos
WHERE artista = 'Laura Gomez'
  AND estado = 'disponible'
ORDER BY precio DESC;