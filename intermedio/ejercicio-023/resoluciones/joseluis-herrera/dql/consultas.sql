USE campuslands_mysql;

SELECT
    p.nombre AS proyecto,
    p.tipo_proyecto,
    c.nombre AS cliente,
    a.nombre AS arquitecto,
    p.estado
FROM proyectos_arquitectura AS p
INNER JOIN clientes AS c
    ON p.cliente_id = c.id
INNER JOIN arquitectos AS a
    ON p.arquitecto_id = a.id
ORDER BY p.nombre;

SELECT
    p.nombre AS proyecto,
    c.nombre AS cliente,
    a.nombre AS arquitecto,
    p.presupuesto,
    p.estado
FROM proyectos_arquitectura AS p
INNER JOIN clientes AS c
    ON p.cliente_id = c.id
INNER JOIN arquitectos AS a
    ON p.arquitecto_id = a.id
WHERE p.estado = 'en_progreso'
ORDER BY p.presupuesto DESC;

SELECT
    c.nombre AS cliente,
    COUNT(p.id) AS total_proyectos,
    AVG(p.presupuesto) AS presupuesto_promedio
FROM clientes AS c
LEFT JOIN proyectos_arquitectura AS p
    ON c.id = p.cliente_id
GROUP BY c.id, c.nombre
ORDER BY total_proyectos DESC;


SELECT
    a.nombre AS arquitecto,
    a.especialidad,
    COUNT(p.id) AS total_proyectos
FROM arquitectos AS a
LEFT JOIN proyectos_arquitectura AS p
    ON a.id = p.arquitecto_id
GROUP BY a.id, a.nombre, a.especialidad
ORDER BY total_proyectos DESC;

SELECT
    p.nombre AS proyecto,
    p.tipo_proyecto,
    p.presupuesto,
    c.nombre AS cliente,
    a.nombre AS arquitecto
FROM proyectos_arquitectura AS p
INNER JOIN clientes AS c
    ON p.cliente_id = c.id
INNER JOIN arquitectos AS a
    ON p.arquitecto_id = a.id
WHERE p.presupuesto > 80000
ORDER BY p.presupuesto DESC;

SELECT
    tipo_proyecto,
    COUNT(*) AS total_proyectos,
    SUM(presupuesto) AS presupuesto_total,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_arquitectura
GROUP BY tipo_proyecto
ORDER BY presupuesto_total DESC;

SELECT
    p.nombre AS proyecto,
    p.tipo_proyecto,
    p.presupuesto,
    p.estado,
    c.nombre AS cliente,
    a.nombre AS arquitecto
FROM proyectos_arquitectura AS p
INNER JOIN clientes AS c
    ON p.cliente_id = c.id
INNER JOIN arquitectos AS a
    ON p.arquitecto_id = a.id
ORDER BY p.presupuesto DESC
LIMIT 5;