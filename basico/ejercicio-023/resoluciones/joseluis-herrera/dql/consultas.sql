USE campuslands_mysql;

UPDATE proyectos_arquitectura
SET presupuesto = presupuesto * 1.10
WHERE tipo_proyecto = 'Residencial';

UPDATE proyectos_arquitectura
SET estado = 'en_progreso'
WHERE estado = 'planificado'
  AND presupuesto > 100000;

UPDATE proyectos_arquitectura
SET estado = 'en_progreso'
WHERE estado = 'pausado';

UPDATE proyectos_arquitectura
SET presupuesto = presupuesto + 5000
WHERE tipo_proyecto = 'Publico';

SELECT
    id,
    nombre,
    tipo_proyecto,
    presupuesto,
    estado,
    fecha_inicio
FROM proyectos_arquitectura
ORDER BY presupuesto DESC;

SELECT
    id,
    nombre,
    presupuesto,
    estado
FROM proyectos_arquitectura
WHERE tipo_proyecto = 'Residencial'
ORDER BY presupuesto DESC;

SELECT
    tipo_proyecto,
    COUNT(*) AS total_proyectos,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_arquitectura
GROUP BY tipo_proyecto
ORDER BY presupuesto_promedio DESC;