USE campuslands_mysql;

-- 1. Pedidos con datos de cliente y platillo (INNER JOIN de 3 tablas)
SELECT p.id_pedido, c.nombre AS cliente, pl.nombre AS platillo, p.cantidad, p.estado
FROM pedidos_intermedio p
INNER JOIN clientes_intermedio c ON c.id_cliente = p.id_cliente
INNER JOIN platillos_intermedio pl ON pl.id_platillo = p.id_platillo
ORDER BY p.id_pedido;

-- 2. Total gastado por cliente, solo pedidos entregados
SELECT c.nombre AS cliente, SUM(p.cantidad * pl.precio) AS total_gastado
FROM pedidos_intermedio p
INNER JOIN clientes_intermedio c ON c.id_cliente = p.id_cliente
INNER JOIN platillos_intermedio pl ON pl.id_platillo = p.id_platillo
WHERE p.estado = 'entregado'
GROUP BY c.nombre
ORDER BY total_gastado DESC;

-- 3. Platillos mas pedidos por unidades acumuladas
SELECT pl.nombre AS platillo, SUM(p.cantidad) AS unidades_pedidas
FROM pedidos_intermedio p
INNER JOIN platillos_intermedio pl ON pl.id_platillo = p.id_platillo
GROUP BY pl.nombre
ORDER BY unidades_pedidas DESC;

-- 4. Pedidos pendientes con datos de contacto del cliente
SELECT p.id_pedido, c.nombre AS cliente, c.telefono, pl.nombre AS platillo, p.cantidad
FROM pedidos_intermedio p
INNER JOIN clientes_intermedio c ON c.id_cliente = p.id_cliente
INNER JOIN platillos_intermedio pl ON pl.id_platillo = p.id_platillo
WHERE p.estado = 'pendiente';

-- 5. Top 5 clientes por gasto total estimado, incluyendo todos los estados
SELECT c.nombre AS cliente, SUM(p.cantidad * pl.precio) AS total_estimado
FROM pedidos_intermedio p
INNER JOIN clientes_intermedio c ON c.id_cliente = p.id_cliente
INNER JOIN platillos_intermedio pl ON pl.id_platillo = p.id_platillo
GROUP BY c.nombre
ORDER BY total_estimado DESC
LIMIT 5;

-- 6. Cantidad de pedidos por ciudad del cliente
SELECT c.ciudad, COUNT(*) AS total_pedidos
FROM pedidos_intermedio p
INNER JOIN clientes_intermedio c ON c.id_cliente = p.id_cliente
GROUP BY c.ciudad
ORDER BY total_pedidos DESC;
