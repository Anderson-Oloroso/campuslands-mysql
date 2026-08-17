USE campuslands_mysql;

-- 1. Proyectos con nombre y ciudad del cliente (via JOIN, no columnas repetidas)
SELECT p.nombre AS proyecto, c.nombre AS cliente, c.ciudad, p.presupuesto
FROM proyectos_arquitectura_intermedio p
INNER JOIN clientes_arquitectura_intermedio c ON c.id_cliente = p.id_cliente
ORDER BY c.nombre, p.nombre;

-- 2. Presupuesto total por cliente
SELECT c.nombre AS cliente, SUM(p.presupuesto) AS presupuesto_total
FROM proyectos_arquitectura_intermedio p
INNER JOIN clientes_arquitectura_intermedio c ON c.id_cliente = p.id_cliente
GROUP BY c.nombre
ORDER BY presupuesto_total DESC;

-- 3. Clientes con mas de un proyecto (GROUP BY + HAVING)
SELECT c.nombre AS cliente, COUNT(*) AS total_proyectos
FROM proyectos_arquitectura_intermedio p
INNER JOIN clientes_arquitectura_intermedio c ON c.id_cliente = p.id_cliente
GROUP BY c.nombre
HAVING COUNT(*) > 1
ORDER BY total_proyectos DESC;

-- 4. Proyectos de clientes ubicados en Bogota
SELECT p.nombre AS proyecto, c.nombre AS cliente
FROM proyectos_arquitectura_intermedio p
INNER JOIN clientes_arquitectura_intermedio c ON c.id_cliente = p.id_cliente
WHERE c.ciudad = 'Bogota';

-- 5. Cliente con mayor presupuesto acumulado
SELECT c.nombre AS cliente, SUM(p.presupuesto) AS presupuesto_total
FROM proyectos_arquitectura_intermedio p
INNER JOIN clientes_arquitectura_intermedio c ON c.id_cliente = p.id_cliente
GROUP BY c.nombre
ORDER BY presupuesto_total DESC
LIMIT 1;

-- 6. Proyectos de "Inversiones Vista Verde": la ciudad ya aparece
-- actualizada a Palmira en los tres, sin haber tocado la tabla de proyectos.
SELECT p.nombre AS proyecto, c.nombre AS cliente, c.ciudad
FROM proyectos_arquitectura_intermedio p
INNER JOIN clientes_arquitectura_intermedio c ON c.id_cliente = p.id_cliente
WHERE c.nombre = 'Inversiones Vista Verde';
