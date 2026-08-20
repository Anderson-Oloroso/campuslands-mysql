USE campuslands_mysql;

-- 1. Consultar la vista de pedidos activos ordenados por la fecha de pedido más reciente
SELECT codigo_pedido, cliente, accesorio, categoria, total_linea, fecha_pedido, estado_pedido
FROM vista_pedidos_activos
ORDER BY fecha_pedido DESC;

-- 2. Consultar el resumen de ventas por categoría directamente desde la vista correspondiente
SELECT categoria, total_pedidos_categoria, ingreso_total_categoria, precio_promedio_accesorio
FROM vista_resumen_ventas_categoria
ORDER BY ingreso_total_categoria DESC;

-- 3. Filtrar pedidos activos desde la vista que superen los 50.00 en monto total de línea
SELECT codigo_pedido, cliente, accesorio, total_linea, estado_pedido
FROM vista_pedidos_activos
WHERE total_linea > 50.00
ORDER BY total_linea DESC;

-- 4. Consultar la vista de pedidos activos filtrando únicamente aquellos que pertenecen a la categoría 'Tecnología'
SELECT codigo_pedido, cliente, accesorio, precio_unitario, cantidad, total_linea, estado_pedido
FROM vista_pedidos_activos
WHERE categoria = 'Tecnología'
ORDER BY total_linea DESC;

-- 5. Top categorías con mayor ingreso total utilizando la vista de resumen con límite
SELECT categoria, ingreso_total_categoria
FROM vista_resumen_ventas_categoria
ORDER BY ingreso_total_categoria DESC
LIMIT 2;