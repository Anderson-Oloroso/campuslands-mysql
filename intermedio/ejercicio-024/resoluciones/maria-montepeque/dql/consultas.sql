USE campuslands_mysql;

-- 1. Trabajos que quedaron sin soldador asignado (evidencia de ON DELETE SET NULL)
SELECT id_trabajo, id_soldador, id_cliente, tipo_soldadura, costo
FROM trabajos_soldadura_intermedio
WHERE id_soldador IS NULL;

-- 2. Listado de trabajos con nombre de soldador (o "Sin asignar") y cliente
SELECT t.id_trabajo,
       COALESCE(s.nombre, 'Sin asignar') AS soldador,
       c.nombre AS cliente,
       t.tipo_soldadura,
       t.costo
FROM trabajos_soldadura_intermedio t
LEFT JOIN soldadores_intermedio s ON s.id_soldador = t.id_soldador
INNER JOIN clientes_soldadura_intermedio c ON c.id_cliente = t.id_cliente
ORDER BY t.id_trabajo;

-- 3. Ingresos totales por cliente
SELECT c.nombre AS cliente, SUM(t.costo) AS ingresos_totales
FROM trabajos_soldadura_intermedio t
INNER JOIN clientes_soldadura_intermedio c ON c.id_cliente = t.id_cliente
GROUP BY c.nombre
ORDER BY ingresos_totales DESC;

-- 4. Soldadores activos y cuantos trabajos tiene cada uno
SELECT s.nombre AS soldador, COUNT(t.id_trabajo) AS total_trabajos
FROM soldadores_intermedio s
LEFT JOIN trabajos_soldadura_intermedio t ON t.id_soldador = s.id_soldador
GROUP BY s.nombre
ORDER BY total_trabajos DESC;

-- 5. Confirmar que Sofia Herrera ya no existe como soldadora
SELECT COUNT(*) AS soldadores_llamados_sofia
FROM soldadores_intermedio
WHERE nombre = 'Sofia Herrera';

-- 6. Confirmar que los trabajos de Sofia Herrera se conservaron (no se borraron)
SELECT COUNT(*) AS trabajos_conservados
FROM trabajos_soldadura_intermedio
WHERE id_trabajo IN (4, 5);

-- Nota de validacion manual: intentar borrar un cliente con trabajos
-- registrados debe fallar por ON DELETE RESTRICT. Por ejemplo:
--   DELETE FROM clientes_soldadura_intermedio WHERE id_cliente = 1;
-- da: ERROR 1451 (23000): Cannot delete or update a parent row: a
-- foreign key constraint fails (no se ejecuta aqui para no interrumpir
-- el script).
