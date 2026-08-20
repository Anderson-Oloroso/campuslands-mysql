USE campuslands_mysql;

SELECT
    id,
    titulo,
    categoria,
    tecnica,
    puntaje,
    estado
FROM dibujos_digitales
WHERE estado = 'activo';

SELECT
    id,
    titulo,
    categoria,
    tecnica,
    puntaje
FROM dibujos_digitales
WHERE categoria = 'Paisaje'
ORDER BY puntaje DESC;

SELECT
    id,
    titulo,
    categoria,
    puntaje
FROM dibujos_digitales
WHERE puntaje >= 90
ORDER BY puntaje DESC;

SELECT
    id,
    titulo,
    categoria,
    tecnica,
    puntaje
FROM dibujos_digitales
WHERE estado = 'activo'
  AND puntaje > 85
ORDER BY puntaje DESC;

SELECT
    id,
    titulo,
    categoria,
    fecha_creacion
FROM dibujos_digitales
WHERE fecha_creacion BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY fecha_creacion;

SELECT
    categoria,
    COUNT(*) AS total_dibujos,
    AVG(puntaje) AS promedio_puntaje
FROM dibujos_digitales
GROUP BY categoria
ORDER BY promedio_puntaje DESC;

SELECT
    id,
    titulo,
    categoria,
    puntaje
FROM dibujos_digitales
ORDER BY puntaje DESC
LIMIT 5;