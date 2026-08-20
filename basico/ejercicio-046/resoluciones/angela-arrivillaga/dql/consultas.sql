USE campuslands_mysql;

-- 1. promedio de precio por categoria para productos disponibles
SELECT categoria, AVG(precio) AS promedio_precio
FROM productos_urbana
WHERE estado = 'disponible'
GROUP BY categoria;

-- 2. top 3 productos mejor calificados del menu urbano
SELECT nombre, categoria, calificacion
FROM productos_urbana
WHERE estado = 'disponible'
ORDER BY calificacion DESC
LIMIT 3;

-- 3. listado de productos filtrados por una categoria especifica
SELECT nombre, precio, calificacion, estado
FROM productos_urbana
WHERE categoria = 'hamburguesa';

-- 4. reporte de productos agrupados por su estado actual
SELECT estado, COUNT(*) AS total_productos
FROM productos_urbana
GROUP BY estado;

-- 5. productos disponibles con precio menor o igual a 20 ordenados por calificacion
SELECT nombre, categoria, precio, calificacion
FROM productos_urbana
WHERE estado = 'disponible' AND precio <= 20.00
ORDER BY calificacion DESC;