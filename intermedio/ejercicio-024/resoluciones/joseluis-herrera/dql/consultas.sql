USE campuslands_mysql;

SELECT
    t.nombre_trabajo AS trabajo,
    t.tipo_soldadura AS tipo_soldadura,
    t.material,
    t.costo,
    t.estado,
    c.nombre AS cliente,
    s.nombre AS soldador
FROM trabajos_soldadura AS t
INNER JOIN clientes AS c
    ON t.cliente_id = c.id
INNER JOIN soldadores AS s
    ON t.soldador_id = s.id
ORDER BY t.nombre_trabajo;


SELECT
    t.nombre_trabajo AS trabajo,
    c.nombre AS cliente,
    s.nombre AS soldador,
    t.costo,
    t.estado
FROM trabajos_soldadura AS t
INNER JOIN clientes AS c
    ON t.cliente_id = c.id
INNER JOIN soldadores AS s
    ON t.soldador_id = s.id
WHERE t.estado = 'en_proceso'
ORDER BY t.costo DESC;

SELECT
    c.nombre AS cliente,
    COUNT(t.id) AS total_trabajos
FROM clientes AS c
LEFT JOIN trabajos_soldadura AS t
    ON c.id = t.cliente_id
GROUP BY c.id, c.nombre
ORDER BY total_trabajos DESC;


SELECT
    s.nombre AS soldador,
    s.especialidad,
    COUNT(t.id) AS total_trabajos
FROM soldadores AS s
LEFT JOIN trabajos_soldadura AS t
    ON s.id = t.soldador_id
GROUP BY s.id, s.nombre, s.especialidad
ORDER BY total_trabajos DESC;

SELECT
    t.nombre_trabajo AS trabajo,
    t.tipo_soldadura,
    t.material,
    t.costo,
    c.nombre AS cliente,
    s.nombre AS soldador
FROM trabajos_soldadura AS t
INNER JOIN clientes AS c
    ON t.cliente_id = c.id
INNER JOIN soldadores AS s
    ON t.soldador_id = s.id
WHERE t.costo > 600
ORDER BY t.costo DESC;


SELECT
    tipo_soldadura,
    COUNT(*) AS total_trabajos,
    SUM(costo) AS costo_total,
    AVG(costo) AS costo_promedio
FROM trabajos_soldadura
GROUP BY tipo_soldadura
ORDER BY costo_total DESC;

SELECT
    t.nombre_trabajo AS trabajo,
    t.tipo_soldadura,
    t.material,
    t.costo,
    c.nombre AS cliente,
    s.nombre AS soldador
FROM trabajos_soldadura AS t
INNER JOIN clientes AS c
    ON t.cliente_id = c.id
INNER JOIN soldadores AS s
    ON t.soldador_id = s.id
ORDER BY t.costo DESC
LIMIT 5;