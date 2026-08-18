USE campuslands_mysql;

SELECT
    id_proyecto,
    nombre_proyecto,
    estado,
    presupuesto
FROM proyectos_arquitectura
WHERE estado = 'revision'
ORDER BY presupuesto DESC;

UPDATE proyectos_arquitectura
SET estado = 'aprobado'
WHERE id_proyecto = 2;

SELECT
    id_proyecto,
    nombre_proyecto,
    estado
FROM proyectos_arquitectura
WHERE id_proyecto = 2;

UPDATE proyectos_arquitectura
SET presupuesto = presupuesto * 1.10
WHERE tipo_proyecto = 'Comercial'
  AND estado = 'diseno';

SELECT
    nombre_proyecto,
    tipo_proyecto,
    presupuesto,
    estado
FROM proyectos_arquitectura
WHERE tipo_proyecto = 'Comercial'
  AND estado = 'diseno'
ORDER BY presupuesto DESC;

UPDATE proyectos_arquitectura
SET estado = 'finalizado'
WHERE fecha_entrega < '2026-06-01'
  AND estado = 'aprobado';

SELECT
    nombre_proyecto,
    fecha_entrega,
    estado
FROM proyectos_arquitectura
WHERE fecha_entrega < '2026-06-01'
ORDER BY fecha_entrega;

SELECT
    estado,
    COUNT(*) AS total_proyectos,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_arquitectura
GROUP BY estado
ORDER BY total_proyectos DESC;