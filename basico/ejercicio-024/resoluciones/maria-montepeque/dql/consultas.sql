USE campuslands_mysql;

-- 1. Estado final de la tabla, tras los tres DELETE controlados
SELECT id_pedido, cliente, tipo_soldadura, estado, fecha_pedido
FROM pedidos_soldadura_basico
ORDER BY id_pedido;

-- 2. Confirmar que ya no quedan pedidos cancelados
SELECT COUNT(*) AS pedidos_cancelados_restantes
FROM pedidos_soldadura_basico
WHERE estado = 'cancelado';

-- 3. Confirmar que el registro de prueba ya no existe
SELECT COUNT(*) AS registros_de_prueba
FROM pedidos_soldadura_basico
WHERE cliente = 'Prueba Test';

-- 4. Pedidos completados, ordenados por costo
SELECT cliente, tipo_soldadura, costo
FROM pedidos_soldadura_basico
WHERE estado = 'completado'
ORDER BY costo DESC;

-- 5. Ingresos totales por tipo de soldadura, solo pedidos completados
SELECT tipo_soldadura, SUM(costo) AS ingresos
FROM pedidos_soldadura_basico
WHERE estado = 'completado'
GROUP BY tipo_soldadura
ORDER BY ingresos DESC;

-- 6. Pedidos pendientes o en proceso (trabajo activo del taller)
SELECT cliente, tipo_soldadura, estado, fecha_pedido
FROM pedidos_soldadura_basico
WHERE estado IN ('pendiente', 'en_proceso')
ORDER BY fecha_pedido;
