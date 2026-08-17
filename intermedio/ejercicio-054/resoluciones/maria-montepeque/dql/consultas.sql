USE campuslands_mysql;

-- 1. Ordenes que quedaron sin tecnico asignado (evidencia de ON DELETE SET NULL)
SELECT id_orden, id_tecnico, id_empresa, tipo_soldadura, costo
FROM ordenes_soldadura_intermedio
WHERE id_tecnico IS NULL;

-- 2. Listado de ordenes con nombre de tecnico (o "Sin asignar") y empresa
SELECT o.id_orden,
       COALESCE(t.nombre, 'Sin asignar') AS tecnico,
       e.nombre AS empresa,
       o.tipo_soldadura,
       o.costo
FROM ordenes_soldadura_intermedio o
LEFT JOIN tecnicos_soldadura_intermedio t ON t.id_tecnico = o.id_tecnico
INNER JOIN empresas_soldadura_intermedio e ON e.id_empresa = o.id_empresa
ORDER BY o.id_orden;

-- 3. Ingresos totales por empresa
SELECT e.nombre AS empresa, SUM(o.costo) AS ingresos_totales
FROM ordenes_soldadura_intermedio o
INNER JOIN empresas_soldadura_intermedio e ON e.id_empresa = o.id_empresa
GROUP BY e.nombre
ORDER BY ingresos_totales DESC;

-- 4. Tecnicos activos y cuantas ordenes tiene cada uno
SELECT t.nombre AS tecnico, COUNT(o.id_orden) AS total_ordenes
FROM tecnicos_soldadura_intermedio t
LEFT JOIN ordenes_soldadura_intermedio o ON o.id_tecnico = t.id_tecnico
GROUP BY t.nombre
ORDER BY total_ordenes DESC;

-- 5. Confirmar que Marcela Suarez ya no existe como tecnica
SELECT COUNT(*) AS tecnicos_llamados_marcela
FROM tecnicos_soldadura_intermedio
WHERE nombre = 'Marcela Suarez';

-- 6. Confirmar que las ordenes de Marcela Suarez se conservaron (no se borraron)
SELECT COUNT(*) AS ordenes_conservadas
FROM ordenes_soldadura_intermedio
WHERE id_orden IN (4, 5);

-- Nota de validacion manual: intentar borrar una empresa con ordenes
-- registradas debe fallar por ON DELETE RESTRICT. Por ejemplo:
--   DELETE FROM empresas_soldadura_intermedio WHERE id_empresa = 1;
-- da: ERROR 1451 (23000): Cannot delete or update a parent row: a
-- foreign key constraint fails (no se ejecuta aqui para no interrumpir
-- el script).
