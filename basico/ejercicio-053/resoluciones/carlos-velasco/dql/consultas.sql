USE campuslands_mysql;

-- ============================================================
-- CONSULTA 1: Visualizar los proyectos registrados
-- ============================================================

SELECT
    id_proyecto,
    nombre_proyecto,
    tipo_proyecto,
    software,
    presupuesto,
    estado,
    fecha_entrega
FROM proyectos_arquitectura_3d
ORDER BY id_proyecto;


-- ============================================================
-- CONSULTA 2: Proyectos que se encuentran en revisión
-- ============================================================

SELECT
    id_proyecto,
    nombre_proyecto,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
WHERE estado = 'en_revision'
ORDER BY presupuesto DESC;


-- ============================================================
-- CONSULTA 3: Actualizar el presupuesto de proyectos
-- residenciales que están en revisión.
-- ============================================================

UPDATE proyectos_arquitectura_3d
SET presupuesto = presupuesto * 1.10
WHERE tipo_proyecto = 'Residencial'
  AND estado = 'en_revision';


-- ============================================================
-- CONSULTA 4: Verificar el resultado del UPDATE
-- ============================================================

SELECT
    id_proyecto,
    nombre_proyecto,
    tipo_proyecto,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
WHERE tipo_proyecto = 'Residencial'
  AND estado = 'en_revision';


-- ============================================================
-- CONSULTA 5: Actualizar el estado de un proyecto
-- cuando ha sido aprobado.
-- ============================================================

UPDATE proyectos_arquitectura_3d
SET estado = 'aprobado'
WHERE id_proyecto = 1
  AND estado = 'en_revision';


-- ============================================================
-- CONSULTA 6: Verificar el cambio de estado
-- ============================================================

SELECT
    id_proyecto,
    nombre_proyecto,
    estado
FROM proyectos_arquitectura_3d
WHERE id_proyecto = 1;


-- ============================================================
-- CONSULTA 7: Presupuesto promedio por tipo de proyecto
-- ============================================================

SELECT
    tipo_proyecto,
    COUNT(*) AS total_proyectos,
    ROUND(AVG(presupuesto), 2) AS presupuesto_promedio
FROM proyectos_arquitectura_3d
GROUP BY tipo_proyecto
ORDER BY presupuesto_promedio DESC;


-- ============================================================
-- CONSULTA 8: Proyectos ordenados por presupuesto
-- ============================================================

SELECT
    nombre_proyecto,
    tipo_proyecto,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
ORDER BY presupuesto DESC;