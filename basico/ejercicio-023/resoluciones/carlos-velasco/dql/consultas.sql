USE campuslands_mysql;

-- 1. Aumentar en 10% el presupuesto de proyectos en proceso.
UPDATE proyectos_arquitectura_3d
SET presupuesto = presupuesto * 1.10
WHERE estado = 'en_proceso';


-- 2. Cambiar a "en_proceso" los proyectos residenciales
-- que todavía están planificados.
UPDATE proyectos_arquitectura_3d
SET estado = 'en_proceso'
WHERE tipo_proyecto = 'Residencial'
  AND estado = 'planificado';


-- 3. Actualizar el software del proyecto "Casa Moderna".
UPDATE proyectos_arquitectura_3d
SET software = 'Revit'
WHERE nombre_proyecto = 'Casa Moderna';


-- 4. Consultar los proyectos modificados que están en proceso.
SELECT
    id_proyecto,
    nombre_proyecto,
    tipo_proyecto,
    software,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
WHERE estado = 'en_proceso'
ORDER BY presupuesto DESC;


-- 5. Consultar los proyectos con presupuesto superior a 20000.
SELECT
    nombre_proyecto,
    arquitecto,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
WHERE presupuesto > 20000
ORDER BY presupuesto DESC;