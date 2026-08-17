USE campuslands_mysql;

-- 1. Vista actualizable: proyectos en progreso (ya refleja el UPDATE del paso anterior)
SELECT * FROM vw_proyectos_en_progreso_avanzado
ORDER BY nombre;

-- 2. Vista de reporte con agregacion: resumen de renders por proyecto
SELECT * FROM vw_resumen_proyectos_avanzado
ORDER BY costo_total DESC;

-- 3. Vista anidada: renders fallidos, solo de proyectos que siguen en progreso
SELECT * FROM vw_renders_pendientes_avanzado
ORDER BY fecha_render;

-- 4. Filtrar sobre una vista de reporte, como si fuera una tabla normal
SELECT proyecto, cliente, renders_exitosos, costo_total
FROM vw_resumen_proyectos_avanzado
WHERE renders_exitosos >= 2
ORDER BY renders_exitosos DESC;

-- 5. Proyectos en progreso con presupuesto mayor a 15000 (consulta sobre la vista actualizable)
SELECT nombre, cliente, presupuesto
FROM vw_proyectos_en_progreso_avanzado
WHERE presupuesto > 15000;

-- 6. Cantidad de renders fallidos pendientes de resolver por cliente
SELECT cliente, COUNT(*) AS renders_fallidos_pendientes
FROM vw_renders_pendientes_avanzado
GROUP BY cliente
ORDER BY renders_fallidos_pendientes DESC;

-- Nota de validacion manual: WITH CHECK OPTION tambien bloquea cambios
-- que saquen la fila del alcance de la vista. Por ejemplo:
--   UPDATE vw_proyectos_en_progreso_avanzado
--   SET estado = 'entregado'
--   WHERE id_proyecto = 1;
-- debe fallar con ERROR 1369 (HY000): CHECK OPTION failed
-- 'campuslands_mysql.vw_proyectos_en_progreso_avanzado' (no se ejecuta
-- aqui para no interrumpir el script).
