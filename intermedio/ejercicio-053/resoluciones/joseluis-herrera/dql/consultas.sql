USE campuslands_mysql;

SELECT
    p.nombre_proyecto,
    a.nombre AS arquitecto,
    t.nombre_tipo AS tipo_proyecto,
    e.nombre_estado AS estado,
    p.presupuesto
FROM proyectos AS p
INNER JOIN arquitectos AS a
    ON p.id_arquitecto = a.id_arquitecto
INNER JOIN tipos_proyecto AS t
    ON p.id_tipo = t.id_tipo
INNER JOIN estados_proyecto AS e
    ON p.id_estado = e.id_estado
ORDER BY p.presupuesto DESC;

SELECT
    t.nombre_tipo AS tipo_proyecto,
    COUNT(p.id_proyecto) AS total_proyectos,
    AVG(p.presupuesto) AS presupuesto_promedio
FROM tipos_proyecto AS t
INNER JOIN proyectos AS p
    ON t.id_tipo = p.id_tipo
GROUP BY t.id_tipo, t.nombre_tipo
ORDER BY presupuesto_promedio DESC;

SELECT
    a.nombre AS arquitecto,
    COUNT(p.id_proyecto) AS total_proyectos,
    SUM(p.presupuesto) AS presupuesto_total
FROM arquitectos AS a
INNER JOIN proyectos AS p
    ON a.id_arquitecto = p.id_arquitecto
GROUP BY a.id_arquitecto, a.nombre
ORDER BY presupuesto_total DESC;

SELECT
    p.nombre_proyecto,
    a.nombre AS arquitecto,
    t.nombre_tipo AS tipo_proyecto,
    p.area_m2,
    p.presupuesto
FROM proyectos AS p
INNER JOIN arquitectos AS a
    ON p.id_arquitecto = a.id_arquitecto
INNER JOIN tipos_proyecto AS t
    ON p.id_tipo = t.id_tipo
INNER JOIN estados_proyecto AS e
    ON p.id_estado = e.id_estado
WHERE e.nombre_estado = 'aprobado'
ORDER BY p.area_m2 DESC;

SELECT
    e.nombre_estado AS estado,
    COUNT(p.id_proyecto) AS total_proyectos,
    SUM(p.presupuesto) AS presupuesto_total
FROM estados_proyecto AS e
INNER JOIN proyectos AS p
    ON e.id_estado = p.id_estado
GROUP BY e.id_estado, e.nombre_estado
ORDER BY total_proyectos DESC;