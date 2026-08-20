USE campuslands_mysql;

-- 1. Mostrar los proyectos con toda su información relacionada.
SELECT
    p.nombre_proyecto AS proyecto,
    a.nombre AS arquitecto,
    t.nombre_tipo AS tipo_proyecto,
    s.nombre_software AS software,
    e.nombre_estado AS estado,
    p.presupuesto
FROM proyectos_arquitectura_3d AS p
INNER JOIN arquitectos AS a
    ON p.id_arquitecto = a.id_arquitecto
INNER JOIN tipos_proyecto AS t
    ON p.id_tipo = t.id_tipo
INNER JOIN softwares_3d AS s
    ON p.id_software = s.id_software
INNER JOIN estados_proyecto AS e
    ON p.id_estado = e.id_estado
ORDER BY p.presupuesto DESC;


-- 2. Proyectos que están actualmente en proceso.
SELECT
    p.nombre_proyecto AS proyecto,
    a.nombre AS arquitecto,
    t.nombre_tipo AS tipo_proyecto,
    p.presupuesto
FROM proyectos_arquitectura_3d AS p
INNER JOIN arquitectos AS a
    ON p.id_arquitecto = a.id_arquitecto
INNER JOIN tipos_proyecto AS t
    ON p.id_tipo = t.id_tipo
INNER JOIN estados_proyecto AS e
    ON p.id_estado = e.id_estado
WHERE e.nombre_estado = 'En proceso'
ORDER BY p.presupuesto DESC;


-- 3. Cantidad de proyectos y presupuesto promedio por tipo.
SELECT
    t.nombre_tipo AS tipo_proyecto,
    COUNT(p.id_proyecto) AS total_proyectos,
    ROUND(AVG(p.presupuesto), 2) AS presupuesto_promedio
FROM tipos_proyecto AS t
LEFT JOIN proyectos_arquitectura_3d AS p
    ON t.id_tipo = p.id_tipo
GROUP BY t.id_tipo, t.nombre_tipo
ORDER BY presupuesto_promedio DESC;


-- 4. Arquitectos con más de un proyecto asignado.
SELECT
    a.nombre AS arquitecto,
    COUNT(p.id_proyecto) AS total_proyectos,
    ROUND(SUM(p.presupuesto), 2) AS presupuesto_total
FROM arquitectos AS a
INNER JOIN proyectos_arquitectura_3d AS p
    ON a.id_arquitecto = p.id_arquitecto
GROUP BY a.id_arquitecto, a.nombre
HAVING COUNT(p.id_proyecto) > 1
ORDER BY total_proyectos DESC, presupuesto_total DESC;


-- 5. Top 5 de proyectos con mayor presupuesto.
SELECT
    p.nombre_proyecto AS proyecto,
    a.nombre AS arquitecto,
    s.nombre_software AS software,
    p.presupuesto
FROM proyectos_arquitectura_3d AS p
INNER JOIN arquitectos AS a
    ON p.id_arquitecto = a.id_arquitecto
INNER JOIN softwares_3d AS s
    ON p.id_software = s.id_software
ORDER BY p.presupuesto DESC
LIMIT 5;