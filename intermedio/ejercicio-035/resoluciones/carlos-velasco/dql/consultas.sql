USE campuslands_mysql;

-- 1. Motos cuyo costo de servicio es superior al costo promedio de todos los servicios.
SELECT
    m.id_moto,
    m.marca,
    m.modelo,
    s.tipo_servicio,
    s.costo
FROM motos AS m
INNER JOIN servicios AS s
    ON m.id_moto = s.id_moto
WHERE s.costo > (
    SELECT AVG(costo)
    FROM servicios
)
ORDER BY s.costo DESC;


-- 2. Motos que tienen al menos un servicio pendiente.
SELECT
    id_moto,
    marca,
    modelo,
    cilindrada
FROM motos
WHERE id_moto IN (
    SELECT id_moto
    FROM servicios
    WHERE estado = 'pendiente'
)
ORDER BY id_moto;


-- 3. Mostrar la moto con el servicio de mayor costo.
SELECT
    m.id_moto,
    m.marca,
    m.modelo,
    s.tipo_servicio,
    s.costo
FROM motos AS m
INNER JOIN servicios AS s
    ON m.id_moto = s.id_moto
WHERE s.costo = (
    SELECT MAX(costo)
    FROM servicios
);


-- 4. Motos cuyo costo total de servicios supera el promedio del costo
-- total de servicios por moto.
SELECT
    m.id_moto,
    m.marca,
    m.modelo,
    (
        SELECT SUM(s1.costo)
        FROM servicios AS s1
        WHERE s1.id_moto = m.id_moto
    ) AS costo_total
FROM motos AS m
WHERE (
    SELECT SUM(s2.costo)
    FROM servicios AS s2
    WHERE s2.id_moto = m.id_moto
) > (
    SELECT AVG(total_por_moto)
    FROM (
        SELECT SUM(costo) AS total_por_moto
        FROM servicios
        GROUP BY id_moto
    ) AS resumen
)
ORDER BY costo_total DESC;


-- 5. Mostrar las motos que tienen más servicios que el promedio
-- de servicios realizados por moto.
SELECT
    m.id_moto,
    m.marca,
    m.modelo,
    (
        SELECT COUNT(*)
        FROM servicios AS s
        WHERE s.id_moto = m.id_moto
    ) AS total_servicios
FROM motos AS m
WHERE (
    SELECT COUNT(*)
    FROM servicios AS s
    WHERE s.id_moto = m.id_moto
) > (
    SELECT AVG(total_servicios)
    FROM (
        SELECT COUNT(*) AS total_servicios
        FROM servicios
        GROUP BY id_moto
    ) AS resumen
)
ORDER BY total_servicios DESC;


-- 6. Mostrar las motos que nunca han tenido un servicio pendiente.
SELECT
    m.id_moto,
    m.marca,
    m.modelo,
    m.estado
FROM motos AS m
WHERE m.id_moto NOT IN (
    SELECT DISTINCT id_moto
    FROM servicios
    WHERE estado = 'pendiente'
)
ORDER BY m.id_moto;