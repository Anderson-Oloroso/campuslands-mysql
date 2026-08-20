USE campuslands_mysql;

SELECT
    id_ilustracion,
    titulo,
    artista,
    tecnica,
    categoria,
    precio
FROM ilustraciones
WHERE estado = 'publicada'
ORDER BY precio DESC;

SELECT
    id_ilustracion,
    titulo,
    artista,
    categoria,
    precio
FROM ilustraciones
WHERE software = 'Procreate'
ORDER BY precio DESC;

SELECT
    tecnica,
    COUNT(*) AS total_ilustraciones,
    AVG(precio) AS precio_promedio
FROM ilustraciones
GROUP BY tecnica
ORDER BY precio_promedio DESC;

SELECT
    id_ilustracion,
    titulo,
    artista,
    tecnica,
    precio
FROM ilustraciones
WHERE precio > 600
ORDER BY precio DESC;

SELECT
    id_ilustracion,
    titulo,
    artista,
    fecha_creacion,
    estado
FROM ilustraciones
WHERE fecha_creacion >= '2026-07-01'
  AND fecha_creacion < '2026-08-01'
ORDER BY fecha_creacion;

SELECT
    artista,
    COUNT(*) AS total_ilustraciones
FROM ilustraciones
GROUP BY artista
ORDER BY total_ilustraciones DESC;


EXPLAIN
SELECT
    id_ilustracion,
    titulo,
    tecnica,
    categoria,
    precio
FROM ilustraciones
WHERE artista = 'Laura Gomez';

EXPLAIN
SELECT
    id_ilustracion,
    titulo,
    artista,
    categoria,
    precio
FROM ilustraciones
WHERE tecnica = 'Realismo digital';

EXPLAIN
SELECT
    id_ilustracion,
    titulo,
    artista,
    fecha_creacion
FROM ilustraciones
WHERE estado = 'publicada';

EXPLAIN
SELECT
    id_ilustracion,
    titulo,
    artista,
    fecha_creacion
FROM ilustraciones
WHERE fecha_creacion >= '2026-07-01';