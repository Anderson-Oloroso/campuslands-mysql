USE campuslands_mysql;

-- 1. Reporte de proyectos detallado (JOINs para 3FN)
SELECT p.nombre_proyecto, c.nombre AS categoria, cl.nombre AS cliente, p.costo
FROM proyectos p
JOIN categorias c ON p.categoria_id = c.id
JOIN clientes cl ON p.cliente_id = cl.id;

-- 2. Inversión total por categoría
SELECT c.nombre, SUM(p.costo) AS inversion_total
FROM categorias c
JOIN proyectos p ON c.id = p.categoria_id
GROUP BY c.nombre;

-- 3. Clientes con proyectos activos
SELECT cl.nombre, COUNT(p.id) AS total_proyectos
FROM clientes cl
JOIN proyectos p ON cl.id = p.cliente_id
WHERE p.estado = 'activo'
GROUP BY cl.nombre;

-- 4. Top 3 proyectos más costosos
SELECT nombre_proyecto, costo FROM proyectos 
ORDER BY costo DESC LIMIT 3;

-- 5. Proyectos por estado
SELECT estado, COUNT(*) AS cantidad 
FROM proyectos GROUP BY estado;