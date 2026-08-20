USE campuslands_mysql;

SELECT
    p.id_producto,
    p.nombre AS producto,
    p.categoria,
    p.precio,
    COALESCE(SUM(dv.cantidad), 0) AS unidades_vendidas
FROM productos AS p
LEFT JOIN detalle_venta AS dv
    ON p.id_producto = dv.id_producto
GROUP BY
    p.id_producto,
    p.nombre,
    p.categoria,
    p.precio
ORDER BY unidades_vendidas DESC;

SELECT
    p.id_producto,
    p.nombre AS producto,
    p.categoria,
    p.precio,
    p.stock
FROM productos AS p
LEFT JOIN detalle_venta AS dv
    ON p.id_producto = dv.id_producto
WHERE dv.id_producto IS NULL
ORDER BY p.nombre ASC;

SELECT
    p.nombre AS producto,
    COUNT(dv.id_detalle) AS total_ventas
FROM productos AS p
LEFT JOIN detalle_venta AS dv
    ON p.id_producto = dv.id_producto
GROUP BY
    p.id_producto,
    p.nombre
ORDER BY total_ventas DESC;

SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COUNT(v.id_venta) AS total_ventas
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY total_ventas DESC;

SELECT
    p.nombre AS producto,
    p.categoria,
    COALESCE(SUM(dv.cantidad * dv.precio_unitario), 0) AS ingreso_generado
FROM productos AS p
LEFT JOIN detalle_venta AS dv
    ON p.id_producto = dv.id_producto
GROUP BY
    p.id_producto,
    p.nombre,
    p.categoria
ORDER BY ingreso_generado DESC;


SELECT
    p.nombre AS producto,
    p.categoria,
    p.stock,
    COALESCE(SUM(dv.cantidad), 0) AS unidades_vendidas
FROM productos AS p
LEFT JOIN detalle_venta AS dv
    ON p.id_producto = dv.id_producto
WHERE p.disponible = TRUE
GROUP BY
    p.id_producto,
    p.nombre,
    p.categoria,
    p.stock
ORDER BY p.stock ASC;