USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Listar los proyectos con la información de sus entidades
-- relacionadas.
-- ============================================================

SELECT
    p.id_proyecto,
    p.nombre_proyecto,
    c.nombre_cliente AS cliente,
    a.nombre_arquitecto AS arquitecto,
    s.nombre_software AS software_3d,
    t.nombre_tipo AS tipo_proyecto,
    p.presupuesto,
    p.estado,
    p.fecha_entrega
FROM proyectos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN arquitectos AS a
    ON p.id_arquitecto = a.id_arquitecto
INNER JOIN software_3d AS s
    ON p.id_software = s.id_software
INNER JOIN tipos_proyecto AS t
    ON p.id_tipo_proyecto = t.id_tipo_proyecto
ORDER BY p.id_proyecto;


-- ============================================================
-- CONSULTA 2
-- Proyectos que se encuentran en revisión.
-- ============================================================

SELECT
    p.nombre_proyecto,
    c.nombre_cliente AS cliente,
    a.nombre_arquitecto AS arquitecto,
    p.presupuesto
FROM proyectos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN arquitectos AS a
    ON p.id_arquitecto = a.id_arquitecto
WHERE p.estado = 'en_revision'
ORDER BY p.presupuesto DESC;


-- ============================================================
-- CONSULTA 3
-- Cantidad de proyectos y presupuesto promedio por tipo.
-- ============================================================

SELECT
    t.nombre_tipo AS tipo_proyecto,
    COUNT(p.id_proyecto) AS total_proyectos,
    ROUND(AVG(p.presupuesto), 2) AS presupuesto_promedio
FROM tipos_proyecto AS t
INNER JOIN proyectos AS p
    ON t.id_tipo_proyecto = p.id_tipo_proyecto
GROUP BY
    t.id_tipo_proyecto,
    t.nombre_tipo
ORDER BY presupuesto_promedio DESC;


-- ============================================================
-- CONSULTA 4
-- Presupuesto total administrado por cada cliente.
-- ============================================================

SELECT
    c.nombre_cliente AS cliente,
    COUNT(p.id_proyecto) AS total_proyectos,
    ROUND(SUM(p.presupuesto), 2) AS presupuesto_total
FROM clientes AS c
INNER JOIN proyectos AS p
    ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre_cliente
ORDER BY presupuesto_total DESC;


-- ============================================================
-- CONSULTA 5
-- Proyectos realizados con software de Autodesk.
-- ============================================================

SELECT
    p.nombre_proyecto,
    s.nombre_software AS software_3d,
    s.fabricante,
    p.presupuesto,
    p.estado
FROM proyectos AS p
INNER JOIN software_3d AS s
    ON p.id_software = s.id_software
WHERE s.fabricante = 'Autodesk'
ORDER BY p.presupuesto DESC;


-- ============================================================
-- CONSULTA 6
-- Proyectos asignados a cada arquitecto.
-- ============================================================

SELECT
    a.nombre_arquitecto AS arquitecto,
    a.especialidad,
    COUNT(p.id_proyecto) AS total_proyectos,
    ROUND(AVG(p.presupuesto), 2) AS presupuesto_promedio
FROM arquitectos AS a
LEFT JOIN proyectos AS p
    ON a.id_arquitecto = p.id_arquitecto
GROUP BY
    a.id_arquitecto,
    a.nombre_arquitecto,
    a.especialidad
ORDER BY total_proyectos DESC;


-- ============================================================
-- CONSULTA 7
-- Proyectos con presupuesto superior al promedio general.
-- ============================================================

SELECT
    p.nombre_proyecto,
    c.nombre_cliente AS cliente,
    p.presupuesto
FROM proyectos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
WHERE p.presupuesto > (
    SELECT AVG(presupuesto)
    FROM proyectos
)
ORDER BY p.presupuesto DESC;


-- ============================================================
-- CONSULTA 8
-- Top 5 proyectos por presupuesto.
-- ============================================================

SELECT
    p.nombre_proyecto,
    t.nombre_tipo AS tipo_proyecto,
    c.nombre_cliente AS cliente,
    p.presupuesto
FROM proyectos AS p
INNER JOIN tipos_proyecto AS t
    ON p.id_tipo_proyecto = t.id_tipo_proyecto
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
ORDER BY p.presupuesto DESC
LIMIT 5;