USE campuslands_mysql;

-- 1. Reporte de TODOS los clientes y su historial de compras (Mostrando NULL para clientes sin compras)
SELECT 
    c.id AS cliente_id,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente_nombre,
    c.email,
    v.id AS venta_id,
    v.fecha_venta,
    COALESCE(v.total, 0.00) AS monto_total
FROM clientes c
LEFT JOIN ventas v ON c.id = v.cliente_id
ORDER BY c.id;

-- 2. Identificar productos (prendas) que NUNCA han sido vendidos
SELECT 
    p.id AS prenda_id,
    p.nombre AS prenda,
    cat.nombre AS categoria,
    p.precio,
    p.stock
FROM prendas p
INNER JOIN categorias cat ON p.categoria_id = cat.id
LEFT JOIN detalle_ventas dv ON p.id = dv.prenda_id
WHERE dv.id IS NULL;

-- 3. Reporte de categorías y el total de prendas vendidas (Incluso categorías sin ventas)
SELECT 
    cat.nombre AS categoria,
    COUNT(p.id) AS prendas_registradas,
    COALESCE(SUM(dv.cantidad), 0) AS total_unidades_vendidas
FROM categorias cat
LEFT JOIN prendas p ON cat.id = p.categoria_id
LEFT JOIN detalle_ventas dv ON p.id = dv.prenda_id
GROUP BY cat.id, cat.nombre;

-- 4. Clientes que no han realizado ninguna compra en la tienda
SELECT 
    c.id AS cliente_id,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id = v.cliente_id
WHERE v.id IS NULL;

-- 5. Conteo general del gasto acumulado de todos los clientes con su respectivo estado de compra
SELECT 
    c.id AS cliente_id,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    COUNT(v.id) AS numero_compras,
    COALESCE(SUM(v.total), 0.00) AS total_gastado,
    CASE 
        WHEN COUNT(v.id) = 0 THEN 'Sin Compras'
        WHEN SUM(v.total) >= 500.00 THEN 'Cliente VIP'
        ELSE 'Cliente Frecuente'
    END AS estado_cliente
FROM clientes c
LEFT JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id, c.nombre, c.apellido;