USE campuslands_mysql;

-- 1. Consultar todos los trabajos junto con el soldador responsable.
SELECT
    t.trabajo_id,
    s.nombre AS soldador,
    s.especialidad,
    t.tipo_trabajo,
    t.material,
    t.fecha_trabajo,
    t.costo,
    t.estado
FROM trabajos_soldadura AS t
INNER JOIN soldadores AS s
    ON t.soldador_id = s.soldador_id
ORDER BY t.fecha_trabajo ASC;


-- 2. Consultar los trabajos que se encuentran en proceso.
SELECT
    t.trabajo_id,
    s.nombre AS soldador,
    t.tipo_trabajo,
    t.material,
    t.costo
FROM trabajos_soldadura AS t
INNER JOIN soldadores AS s
    ON t.soldador_id = s.soldador_id
WHERE t.estado = 'en_proceso'
ORDER BY t.costo DESC;


-- 3. Calcular la cantidad de trabajos y el costo total
--    realizado por cada soldador.
SELECT
    s.soldador_id,
    s.nombre AS soldador,
    COUNT(t.trabajo_id) AS total_trabajos,
    COALESCE(SUM(t.costo), 0) AS costo_total
FROM soldadores AS s
LEFT JOIN trabajos_soldadura AS t
    ON s.soldador_id = t.soldador_id
GROUP BY
    s.soldador_id,
    s.nombre
ORDER BY costo_total DESC;


-- 4. Obtener los soldadores cuyo costo acumulado
--    de trabajos supera los 700.
SELECT
    s.nombre AS soldador,
    COUNT(t.trabajo_id) AS total_trabajos,
    SUM(t.costo) AS costo_total
FROM soldadores AS s
INNER JOIN trabajos_soldadura AS t
    ON s.soldador_id = t.soldador_id
GROUP BY
    s.soldador_id,
    s.nombre
HAVING SUM(t.costo) > 700
ORDER BY costo_total DESC;


-- 5. Consultar los trabajos con costo superior al promedio.
SELECT
    t.trabajo_id,
    s.nombre AS soldador,
    t.tipo_trabajo,
    t.material,
    t.costo
FROM trabajos_soldadura AS t
INNER JOIN soldadores AS s
    ON t.soldador_id = s.soldador_id
WHERE t.costo > (
    SELECT AVG(costo)
    FROM trabajos_soldadura
)
ORDER BY t.costo DESC;