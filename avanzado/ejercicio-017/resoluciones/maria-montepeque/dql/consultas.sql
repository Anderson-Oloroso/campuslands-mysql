USE campuslands_mysql;

-- 1. Productos en o por debajo de un umbral de stock (usa el procedimiento)
CALL sp_productos_bajo_stock(6);

-- 2. Resumen general de ventas (usa el procedimiento)
CALL sp_resumen_ventas();

-- 3. Ingresos totales por categoria
SELECT pr.categoria, SUM(v.total) AS ingresos_categoria
FROM ventas_avanzado v
INNER JOIN productos_avanzado pr ON pr.id_producto = v.id_producto
GROUP BY pr.categoria
ORDER BY ingresos_categoria DESC;

-- 4. Productos que aun no registran ninguna venta
SELECT pr.nombre, pr.categoria, pr.stock
FROM productos_avanzado pr
LEFT JOIN ventas_avanzado v ON v.id_producto = pr.id_producto
WHERE v.id_venta IS NULL;

-- 5. Historial de ventas con detalle de producto
SELECT v.id_venta, pr.nombre AS producto, v.cantidad, v.total, v.fecha_venta
FROM ventas_avanzado v
INNER JOIN productos_avanzado pr ON pr.id_producto = v.id_producto
ORDER BY v.id_venta;

-- 6. Producto mas vendido por unidades acumuladas
SELECT pr.nombre AS producto, SUM(v.cantidad) AS unidades_vendidas
FROM ventas_avanzado v
INNER JOIN productos_avanzado pr ON pr.id_producto = v.id_producto
GROUP BY pr.nombre
ORDER BY unidades_vendidas DESC
LIMIT 1;

-- Nota de validacion manual: sp_registrar_venta tambien controla errores.
-- Ejecutando, por ejemplo, CALL sp_registrar_venta(7, 999);
-- se espera el error controlado 'Stock insuficiente para completar la venta'
-- y que el inventario quede intacto (no se corre aqui para no interrumpir el script).
