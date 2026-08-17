USE campuslands_mysql;

-- 1. Encargos con nombre y ciudad del cliente (via JOIN, no columnas repetidas)
SELECT e.nombre AS encargo, c.nombre AS cliente, c.ciudad, e.presupuesto
FROM encargos_arq_intermedio e
INNER JOIN clientes_arq_intermedio c ON c.id_cliente = e.id_cliente
ORDER BY c.nombre, e.nombre;

-- 2. Presupuesto total por cliente
SELECT c.nombre AS cliente, SUM(e.presupuesto) AS presupuesto_total
FROM encargos_arq_intermedio e
INNER JOIN clientes_arq_intermedio c ON c.id_cliente = e.id_cliente
GROUP BY c.nombre
ORDER BY presupuesto_total DESC;

-- 3. Clientes con mas de un encargo (GROUP BY + HAVING)
SELECT c.nombre AS cliente, COUNT(*) AS total_encargos
FROM encargos_arq_intermedio e
INNER JOIN clientes_arq_intermedio c ON c.id_cliente = e.id_cliente
GROUP BY c.nombre
HAVING COUNT(*) > 1
ORDER BY total_encargos DESC;

-- 4. Encargos de clientes ubicados en Bogota
SELECT e.nombre AS encargo, c.nombre AS cliente
FROM encargos_arq_intermedio e
INNER JOIN clientes_arq_intermedio c ON c.id_cliente = e.id_cliente
WHERE c.ciudad = 'Bogota';

-- 5. Cliente con mayor presupuesto acumulado
SELECT c.nombre AS cliente, SUM(e.presupuesto) AS presupuesto_total
FROM encargos_arq_intermedio e
INNER JOIN clientes_arq_intermedio c ON c.id_cliente = e.id_cliente
GROUP BY c.nombre
ORDER BY presupuesto_total DESC
LIMIT 1;

-- 6. Encargos de "Inversiones Costa Azul": la ciudad ya aparece
-- actualizada a Palmira, sin haber tocado la tabla de encargos.
SELECT e.nombre AS encargo, c.nombre AS cliente, c.ciudad
FROM encargos_arq_intermedio e
INNER JOIN clientes_arq_intermedio c ON c.id_cliente = e.id_cliente
WHERE c.nombre = 'Inversiones Costa Azul';
