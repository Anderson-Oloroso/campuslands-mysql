USE campuslands_mysql;

-- 1. Dibujos activos ordenados por puntaje de mayor a menor.
SELECT
    id_dibujo,
    titulo,
    artista,
    tecnica,
    puntaje,
    estado
FROM dibujos_digitales
WHERE estado = 'activo'
ORDER BY puntaje DESC;


-- 2. Promedio de puntaje y cantidad de dibujos por técnica.
SELECT
    tecnica,
    COUNT(*) AS total_dibujos,
    ROUND(AVG(puntaje), 2) AS puntaje_promedio
FROM dibujos_digitales
GROUP BY tecnica
ORDER BY puntaje_promedio DESC;


-- 3. Top 5 de dibujos con mayor puntaje.
SELECT
    titulo,
    artista,
    tecnica,
    puntaje
FROM dibujos_digitales
ORDER BY puntaje DESC
LIMIT 5;


-- 4. Dibujos que requieren más de 12 horas de trabajo.
SELECT
    titulo,
    artista,
    horas_trabajo,
    puntaje
FROM dibujos_digitales
WHERE horas_trabajo > 12
ORDER BY horas_trabajo DESC;


-- 5. Cantidad de dibujos y horas totales por estado.
SELECT
    estado,
    COUNT(*) AS total_dibujos,
    ROUND(SUM(horas_trabajo), 2) AS horas_totales
FROM dibujos_digitales
GROUP BY estado
ORDER BY horas_totales DESC;