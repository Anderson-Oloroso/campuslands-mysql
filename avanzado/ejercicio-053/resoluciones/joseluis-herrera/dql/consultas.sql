USE campuslands_mysql;

SELECT
    estado,
    COUNT(*) AS total_proyectos,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_arquitectura
GROUP BY estado
ORDER BY total_proyectos DESC;

SELECT
    arquitecto,
    COUNT(*) AS total_proyectos,
    SUM(presupuesto) AS presupuesto_total
FROM proyectos_arquitectura
GROUP BY arquitecto
ORDER BY presupuesto_total DESC;

SELECT
    nombre_proyecto,
    arquitecto,
    tipo_proyecto,
    area_m2,
    presupuesto
FROM proyectos_arquitectura
WHERE estado = 'aprobado'
ORDER BY presupuesto DESC;

SELECT
    nombre_proyecto,
    arquitecto,
    area_m2,
    presupuesto,
    estado
FROM proyectos_arquitectura
WHERE presupuesto > 2000000
ORDER BY presupuesto DESC
LIMIT 5;

SHOW GRANTS FOR 'arquitectura_lector';

SHOW GRANTS FOR 'arquitectura_gestor';