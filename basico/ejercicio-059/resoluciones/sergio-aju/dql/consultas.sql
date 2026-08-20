USE campuslands_mysql;

-- 1. Pedidos realizados en el mes actual (agosto 2026)
SELECT * FROM pedidos_accesorios 
WHERE MONTH(fecha_pedido) = 8 AND YEAR(fecha_pedido) = 2026;

-- 2. Días transcurridos desde el pedido hasta hoy (Antigüedad)
SELECT producto_accesorio, cliente_nombre, 
       DATEDIFF(NOW(), fecha_pedido) AS dias_transcurridos
FROM pedidos_accesorios;

-- 3. Ventas totales por mes
SELECT MONTHNAME(fecha_pedido) AS mes, SUM(precio_usd) AS total_ventas_usd
FROM pedidos_accesorios
GROUP BY mes;

-- 4. Pedidos entregados con más de 30 días de antigüedad
SELECT * FROM pedidos_accesorios
WHERE estado_pedido = 'entregado' AND DATEDIFF(NOW(), fecha_pedido) > 30;

-- 5. Ranking de clientes según gasto acumulado (usando fecha para filtrar si es necesario)
SELECT cliente_nombre, SUM(precio_usd) AS gasto_total
FROM pedidos_accesorios
WHERE estado_pedido != 'cancelado'
GROUP BY cliente_nombre
ORDER BY gasto_total DESC;