-- ============================================================
-- Ejercicio 016 - Consultas
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Consulta 1
-- Productos activos ordenados por precio descendente.
-- Demuestra filtros y ordenamiento.
-- ------------------------------------------------------------
SELECT
    id_producto,
    nombre,
    categoria,
    precio,
    stock
FROM productos
WHERE estado = 'activo'
ORDER BY precio DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Ranking de productos por precio.
-- Demuestra cálculo y ranking mediante DENSE_RANK.
-- ------------------------------------------------------------
SELECT
    nombre,
    categoria,
    precio,
    DENSE_RANK() OVER (
        ORDER BY precio DESC
    ) AS ranking_precio
FROM productos
WHERE estado = 'activo'
ORDER BY ranking_precio;


-- ------------------------------------------------------------
-- Consulta 3
-- Resumen de ventas por estado de pedido.
-- Demuestra GROUP BY y agregaciones.
-- ------------------------------------------------------------
SELECT
    estado,
    COUNT(*) AS total_pedidos,
    SUM(total) AS valor_total,
    AVG(total) AS promedio_pedido
FROM pedidos
GROUP BY estado
ORDER BY valor_total DESC;


-- ------------------------------------------------------------
-- Consulta 4
-- Productos vendidos y cantidad total solicitada.
-- Demuestra JOIN, GROUP BY y agregaciones.
-- ------------------------------------------------------------
SELECT
    p.nombre AS producto,
    p.categoria,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.cantidad * dp.precio_unitario) AS ingresos_generados
FROM detalle_pedido AS dp
INNER JOIN productos AS p
    ON p.id_producto = dp.id_producto
INNER JOIN pedidos AS pe
    ON pe.id_pedido = dp.id_pedido
WHERE pe.estado <> 'cancelado'
GROUP BY
    p.id_producto,
    p.nombre,
    p.categoria
ORDER BY unidades_vendidas DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Categorías que generan más de 50.00 en ventas.
-- Demuestra GROUP BY y HAVING.
-- ------------------------------------------------------------
SELECT
    p.categoria,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.cantidad * dp.precio_unitario) AS ingresos
FROM detalle_pedido AS dp
INNER JOIN productos AS p
    ON p.id_producto = dp.id_producto
INNER JOIN pedidos AS pe
    ON pe.id_pedido = dp.id_pedido
WHERE pe.estado <> 'cancelado'
GROUP BY p.categoria
HAVING ingresos > 50.00
ORDER BY ingresos DESC;


-- ------------------------------------------------------------
-- Consulta 6
-- Pedidos cuyo valor está por encima del promedio general.
-- Demuestra subconsulta.
-- ------------------------------------------------------------
SELECT
    id_pedido,
    cliente,
    estado,
    total
FROM pedidos
WHERE total > (
    SELECT AVG(total)
    FROM pedidos
)
ORDER BY total DESC;


-- ------------------------------------------------------------
-- Consulta 7
-- Top 5 productos por ingresos generados.
-- Demuestra ranking, JOIN y agregaciones.
-- ------------------------------------------------------------
SELECT
    p.nombre AS producto,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.cantidad * dp.precio_unitario) AS ingresos_generados,
    RANK() OVER (
        ORDER BY SUM(dp.cantidad * dp.precio_unitario) DESC
    ) AS posicion
FROM detalle_pedido AS dp
INNER JOIN productos AS p
    ON p.id_producto = dp.id_producto
INNER JOIN pedidos AS pe
    ON pe.id_pedido = dp.id_pedido
WHERE pe.estado <> 'cancelado'
GROUP BY
    p.id_producto,
    p.nombre
ORDER BY ingresos_generados DESC
LIMIT 5;


-- ------------------------------------------------------------
-- Consulta 8
-- Estado actual del inventario activo.
-- Permite comprobar el efecto de la transacción COMMIT.
-- ------------------------------------------------------------
SELECT
    id_producto,
    nombre,
    categoria,
    stock,
    CASE
        WHEN stock <= 10 THEN 'stock bajo'
        WHEN stock <= 20 THEN 'stock medio'
        ELSE 'stock suficiente'
    END AS nivel_stock
FROM productos
WHERE estado = 'activo'
ORDER BY stock ASC;