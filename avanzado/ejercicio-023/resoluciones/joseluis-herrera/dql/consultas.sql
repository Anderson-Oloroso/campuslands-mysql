USE campuslands_mysql;


-- =========================================================
-- CONSULTA 1
-- Mostrar todos los proyectos con su cliente y arquitecto.
-- =========================================================

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
ORDER BY p.presupuesto DESC;


-- =========================================================
-- CONSULTA 2
-- Mostrar proyectos que requieren un presupuesto superior
-- a 80000.
-- =========================================================

SELECT
    p.nombre AS proyecto,
    p.tipo_proyecto,
    p.presupuesto,
    p.estado
FROM proyectos_arquitectura AS p
WHERE p.presupuesto > 80000
ORDER BY p.presupuesto DESC;


-- =========================================================
-- CONSULTA 3
-- Resumen de proyectos por tipo.
-- =========================================================

SELECT
    tipo_proyecto,
    COUNT(*) AS total_proyectos,
    AVG(presupuesto) AS presupuesto_promedio,
    SUM(presupuesto) AS presupuesto_total
FROM proyectos_arquitectura
GROUP BY tipo_proyecto
ORDER BY presupuesto_total DESC;


-- =========================================================
-- CONSULTA 4
-- Mostrar proyectos actualmente en progreso.
-- =========================================================

SELECT
    p.nombre AS proyecto,
    c.nombre AS cliente,
    a.nombre AS arquitecto,
    p.presupuesto
FROM proyectos_arquitectura AS p
INNER JOIN clientes AS c
    ON p.cliente_id = c.id
INNER JOIN arquitectos AS a
    ON p.arquitecto_id = a.id
WHERE p.estado = 'en_progreso'
ORDER BY p.presupuesto DESC;


-- =========================================================
-- CONSULTA 5
-- Mostrar los 5 proyectos con mayor presupuesto.
-- =========================================================

SELECT
    p.nombre AS proyecto,
    p.tipo_proyecto,
    p.presupuesto,
    p.estado
FROM proyectos_arquitectura AS p
ORDER BY p.presupuesto DESC
LIMIT 5;


-- =========================================================
-- CONSULTA 6
-- Mostrar la cantidad de proyectos asignados a cada
-- arquitecto.
-- =========================================================

SELECT
    a.nombre AS arquitecto,
    a.especialidad,
    COUNT(p.id) AS total_proyectos
FROM arquitectos AS a
LEFT JOIN proyectos_arquitectura AS p
    ON a.id = p.arquitecto_id
GROUP BY a.id, a.nombre, a.especialidad
ORDER BY total_proyectos DESC;


-- =========================================================
-- CONSULTA 7
-- Comprobar los permisos asignados a los roles.
-- =========================================================

SHOW GRANTS FOR 'rol_arquitectura_lectura';

SHOW GRANTS FOR 'rol_arquitectura_gestion';