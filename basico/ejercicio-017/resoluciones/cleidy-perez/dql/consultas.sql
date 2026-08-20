-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    v.id_venta,
    v.fecha_venta,
    p.nombre_prenda,
    p.talla,
    p.color,
    v.cantidad,
    p.precio AS precio_unitario,
    (v.cantidad * p.precio) AS total_venta,
    v.metodo_pago
FROM ventas v
JOIN productos_ropa p ON v.id_producto = p.id_producto
ORDER BY v.fecha_venta DESC;
