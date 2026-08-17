USE campuslands_mysql;

-- 1. Estado final del inventario, menor stock primero
SELECT nombre, unidad_medida, stock_actual, stock_minimo
FROM ingredientes_avanzado
ORDER BY stock_actual ASC;

-- 2. Ingredientes que necesitan reabastecimiento (stock en o bajo el minimo)
SELECT nombre, stock_actual, stock_minimo
FROM ingredientes_avanzado
WHERE stock_actual <= stock_minimo;

-- 3. Pedidos que quedaron confirmados despues de las transacciones
SELECT id_pedido, cliente_nombre, total, estado, creado_en
FROM pedidos_avanzado
ORDER BY id_pedido;

-- 4. Historial de movimientos de inventario asociados a cada pedido
SELECT m.id_movimiento, p.cliente_nombre, i.nombre AS ingrediente, m.tipo, m.cantidad, m.creado_en
FROM movimientos_inventario_avanzado m
INNER JOIN ingredientes_avanzado i ON i.id_ingrediente = m.id_ingrediente
INNER JOIN pedidos_avanzado p ON p.id_pedido = m.id_pedido
ORDER BY m.id_movimiento;

-- 5. Total de salidas de inventario por ingrediente
SELECT i.nombre AS ingrediente, SUM(m.cantidad) AS total_salidas
FROM movimientos_inventario_avanzado m
INNER JOIN ingredientes_avanzado i ON i.id_ingrediente = m.id_ingrediente
WHERE m.tipo = 'salida'
GROUP BY i.nombre
ORDER BY total_salidas DESC;

-- 6. Confirmar que el pedido cancelado de Ana Torres (ROLLBACK) no quedo registrado
SELECT COUNT(*) AS pedidos_de_ana
FROM pedidos_avanzado
WHERE cliente_nombre = 'Ana Torres';
