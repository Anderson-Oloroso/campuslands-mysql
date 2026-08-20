-- Consultas con INNER JOIN sobre clientes_restaurante y pedidos_restaurante.
USE campuslands_mysql;

-- 1. Listado de pedidos con el nombre del cliente
SELECT c.nombre AS cliente, p.platillo, p.precio, p.fecha_pedido
FROM pedidos_restaurante p
INNER JOIN clientes_restaurante c ON c.id = p.cliente_id
ORDER BY p.fecha_pedido;

-- 2. Total gastado por cliente (solo clientes con al menos un pedido)
SELECT c.nombre AS cliente, COUNT(*) AS total_pedidos, SUM(p.precio) AS total_gastado
FROM clientes_restaurante c
INNER JOIN pedidos_restaurante p ON p.cliente_id = c.id
GROUP BY c.nombre
ORDER BY total_gastado DESC;

-- 3. Pedidos de un platillo especifico con datos del cliente
SELECT c.nombre AS cliente, c.telefono, p.fecha_pedido
FROM pedidos_restaurante p
INNER JOIN clientes_restaurante c ON c.id = p.cliente_id
WHERE p.platillo = 'Burger Urbana'
ORDER BY p.fecha_pedido;

-- 4. Clientes cuyo total gastado supera Q100
SELECT c.nombre AS cliente, SUM(p.precio) AS total_gastado
FROM clientes_restaurante c
INNER JOIN pedidos_restaurante p ON p.cliente_id = c.id
GROUP BY c.nombre
HAVING SUM(p.precio) > 100
ORDER BY total_gastado DESC;

-- 5. Nota sobre INNER JOIN: Hugo Marroquin (id 5) solo tiene un pedido
-- y si no tuviera ninguno, INNER JOIN lo excluiria del resultado
-- (a diferencia de LEFT JOIN, ver ejercicio 017).
