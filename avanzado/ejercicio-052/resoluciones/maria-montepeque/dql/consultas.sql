USE campuslands_mysql;

-- 1. Vista actualizable: producciones activas (ya refleja el UPDATE del paso anterior)
SELECT * FROM vw_producciones_activas_avanzado
ORDER BY nombre;

-- 2. Vista de reporte con agregacion: resumen de entregas por produccion
SELECT * FROM vw_resumen_producciones_avanzado
ORDER BY costo_total DESC;

-- 3. Vista anidada: entregas fallidas, solo de producciones que siguen activas
SELECT * FROM vw_entregas_fallidas_avanzado
ORDER BY fecha_entrega;

-- 4. Filtrar sobre una vista de reporte, como si fuera una tabla normal
SELECT produccion, cliente, entregas_exitosas, costo_total
FROM vw_resumen_producciones_avanzado
WHERE entregas_exitosas >= 2
ORDER BY entregas_exitosas DESC;

-- 5. Producciones activas con presupuesto mayor a 15000 (consulta sobre la vista actualizable)
SELECT nombre, cliente, presupuesto
FROM vw_producciones_activas_avanzado
WHERE presupuesto > 15000;

-- 6. Cantidad de entregas fallidas pendientes de resolver, por cliente
SELECT cliente, COUNT(*) AS entregas_fallidas_pendientes
FROM vw_entregas_fallidas_avanzado
GROUP BY cliente
ORDER BY entregas_fallidas_pendientes DESC;

-- Nota de validacion manual: WITH CHECK OPTION tambien bloquea cambios
-- que saquen la fila del alcance de la vista. Por ejemplo:
--   UPDATE vw_producciones_activas_avanzado
--   SET estado = 'entregada'
--   WHERE id_produccion = 1;
-- debe fallar con ERROR 1369 (HY000): CHECK OPTION failed
-- 'campuslands_mysql.vw_producciones_activas_avanzado' (no se ejecuta
-- aqui para no interrumpir el script).
