USE campuslands_mysql;

-- 1. Top 3 productos con mas ingresos (usa el procedimiento)
CALL sp_top_productos_ropa(3);

-- 2. Resumen completo de un producto especifico (usa el procedimiento)
CALL sp_resumen_producto_ropa('Camiseta Basica Blanca');

-- 3. Tabla de ingresos completa, ordenada de mayor a menor
SELECT nombre, categoria, ingresos_totales
FROM productos_avanzado
ORDER BY ingresos_totales DESC;

-- 4. Historial de ventas con el total que dejo cada una
SELECT p.nombre, v.cantidad, v.total_venta
FROM ventas_avanzado v
INNER JOIN productos_avanzado p ON p.id_producto = v.id_producto
ORDER BY v.id_venta;

-- 5. Total promedio por venta, por producto
SELECT p.nombre, ROUND(AVG(v.total_venta), 1) AS total_promedio_por_venta
FROM ventas_avanzado v
INNER JOIN productos_avanzado p ON p.id_producto = v.id_producto
GROUP BY p.nombre
ORDER BY total_promedio_por_venta DESC;

-- 6. Verificar consistencia: la suma de total_venta de cada producto
-- debe coincidir con su ingresos_totales
SELECT p.nombre, p.ingresos_totales, SUM(v.total_venta) AS suma_ventas
FROM productos_avanzado p
INNER JOIN ventas_avanzado v ON v.id_producto = p.id_producto
GROUP BY p.nombre, p.ingresos_totales;
