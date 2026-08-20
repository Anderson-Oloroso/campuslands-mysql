-- Consultas analiticas demostrando el uso de INNER JOIN.
USE campuslands_mysql;

-- Listar los platos que conforman el pedido #1
SELECT pd.pedido_id, p.nombre AS plato, pd.cantidad, pd.precio_unitario 
    FROM intermedio_ejercicio_016_pedido_detalles pd
    INNER JOIN intermedio_ejercicio_016_platos p ON pd.plato_id = p.id
    WHERE pd.pedido_id = 1;

-- Calcular el subtotal por linea en los detalles del pedido #3
SELECT pd.pedido_id, p.nombre AS plato, pd.cantidad, pd.precio_unitario, (pd.cantidad * pd.precio_unitario) AS subtotal_linea
    FROM intermedio_ejercicio_016_pedido_detalles pd
    INNER JOIN intermedio_ejercicio_016_platos p ON pd.plato_id = p.id
    WHERE pd.pedido_id = 3;

-- Generar un recibo (ticket) completo cruzando cliente, pedido y platos
SELECT pe.cliente, pe.numero_mesa, p.nombre AS plato, pd.cantidad, (pd.cantidad * pd.precio_unitario) AS total_item
    FROM intermedio_ejercicio_016_pedidos pe
    INNER JOIN intermedio_ejercicio_016_pedido_detalles pd ON pe.id = pd.pedido_id
    INNER JOIN intermedio_ejercicio_016_platos p ON pd.plato_id = p.id
    ORDER BY pe.id ASC;

-- Conocer los platos mas vendidos en el restaurante
SELECT p.nombre, p.categoria, SUM(pd.cantidad) AS total_unidades_vendidas
    FROM intermedio_ejercicio_016_platos p
    INNER JOIN intermedio_ejercicio_016_pedido_detalles pd ON p.id = pd.plato_id
    GROUP BY p.id, p.nombre, p.categoria
    ORDER BY total_unidades_vendidas DESC;

-- INNER JOIN calculando ingresos totales por pedido
SELECT pe.id AS numero_pedido, pe.cliente, SUM(pd.cantidad * pd.precio_unitario) AS total_factura
    FROM intermedio_ejercicio_016_pedidos pe
    INNER JOIN intermedio_ejercicio_016_pedido_detalles pd ON pe.id = pd.pedido_id
    GROUP BY pe.id, pe.cliente
    ORDER BY total_factura DESC;