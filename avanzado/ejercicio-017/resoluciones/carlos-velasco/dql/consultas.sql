-- ============================================================
-- Ejercicio 017 - Consultas y procedimientos almacenados
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Productos activos ordenados por precio.
-- ------------------------------------------------------------
SELECT
    id_producto,
    nombre,
    categoria,
    talla,
    precio,
    stock
FROM productos
WHERE estado = 'activo'
ORDER BY precio DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Cantidad de productos y precio promedio por categoría.
-- ------------------------------------------------------------
SELECT
    categoria,
    COUNT(*) AS total_productos,
    AVG(precio) AS precio_promedio,
    SUM(stock) AS stock_total
FROM productos
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY precio_promedio DESC;


-- ------------------------------------------------------------
-- Consulta 3
-- Productos con stock bajo.
-- ------------------------------------------------------------
SELECT
    nombre AS producto,
    categoria,
    stock,
    precio
FROM productos
WHERE estado = 'activo'
  AND stock <= 10
ORDER BY stock ASC;


-- ------------------------------------------------------------
-- Consulta 4
-- Ventas completadas con información del cliente.
-- ------------------------------------------------------------
SELECT
    id_venta,
    cliente,
    fecha_venta,
    total
FROM ventas
WHERE estado = 'completada'
ORDER BY total DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Productos vendidos y unidades totales.
-- ------------------------------------------------------------
SELECT
    p.nombre AS producto,
    p.categoria,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos_generados
FROM detalle_venta AS dv
INNER JOIN productos AS p
    ON p.id_producto = dv.id_producto
INNER JOIN ventas AS v
    ON v.id_venta = dv.id_venta
WHERE v.estado = 'completada'
GROUP BY
    p.id_producto,
    p.nombre,
    p.categoria
ORDER BY ingresos_generados DESC;


-- ------------------------------------------------------------
-- Consulta 6
-- Categorías con ingresos superiores a 100.00.
-- ------------------------------------------------------------
SELECT
    p.categoria,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos
FROM detalle_venta AS dv
INNER JOIN productos AS p
    ON p.id_producto = dv.id_producto
INNER JOIN ventas AS v
    ON v.id_venta = dv.id_venta
WHERE v.estado = 'completada'
GROUP BY p.categoria
HAVING ingresos > 100.00
ORDER BY ingresos DESC;


-- ------------------------------------------------------------
-- Consulta 7
-- Ventas superiores al promedio de las ventas completadas.
-- ------------------------------------------------------------
SELECT
    id_venta,
    cliente,
    fecha_venta,
    total
FROM ventas
WHERE estado = 'completada'
  AND total > (
      SELECT AVG(total)
      FROM ventas
      WHERE estado = 'completada'
  )
ORDER BY total DESC;


-- ------------------------------------------------------------
-- Consulta 8
-- Top 5 productos por ingresos generados.
-- ------------------------------------------------------------
SELECT
    p.nombre AS producto,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos_generados,
    RANK() OVER (
        ORDER BY SUM(dv.cantidad * dv.precio_unitario) DESC
    ) AS posicion
FROM detalle_venta AS dv
INNER JOIN productos AS p
    ON p.id_producto = dv.id_producto
INNER JOIN ventas AS v
    ON v.id_venta = dv.id_venta
WHERE v.estado = 'completada'
GROUP BY
    p.id_producto,
    p.nombre
ORDER BY ingresos_generados DESC
LIMIT 5;


-- ============================================================
-- PRUEBAS DE PROCEDIMIENTOS ALMACENADOS
-- ============================================================

-- Productos activos de la categoría camisetas.
CALL sp_productos_por_categoria('camisetas');


-- Productos con stock igual o inferior a 10 unidades.
CALL sp_productos_stock_bajo(10);


-- Resumen de ventas de un cliente.
CALL sp_resumen_ventas_cliente('Laura Martinez');


-- Registrar una nueva venta y descontar el stock.
CALL sp_registrar_venta(
    'Carlos Velasco',
    2,
    2
);


-- Comprobar el efecto de la venta registrada.
SELECT
    id_producto,
    nombre,
    stock
FROM productos
WHERE id_producto = 2;


-- Comprobar la nueva venta.
SELECT
    v.id_venta,
    v.cliente,
    v.fecha_venta,
    v.estado,
    v.total,
    p.nombre AS producto,
    dv.cantidad,
    dv.precio_unitario
FROM ventas AS v
INNER JOIN detalle_venta AS dv
    ON dv.id_venta = v.id_venta
INNER JOIN productos AS p
    ON p.id_producto = dv.id_producto
WHERE v.cliente = 'Carlos Velasco'
ORDER BY v.id_venta DESC;