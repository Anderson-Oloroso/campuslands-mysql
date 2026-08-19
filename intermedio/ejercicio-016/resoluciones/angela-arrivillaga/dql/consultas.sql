USE restaurante_urbano_db;

-- 1. Reporte completo utilizando INNER JOIN relacionando código, nombre del plato, categoría culinaria, precio, calorías y estado operativo
SELECT p.codigo_plato, p.nombre_plato, c.nombre_categoria AS categoria, CONCAT('$', FORMAT(p.precio, 2)) AS precio_usd, p.calorias, p.estado_plato
FROM platos_urbanos p
INNER JOIN categorias_menu c ON p.id_categoria = c.id_categoria
ORDER BY p.precio DESC;

-- 2. Reporte estadístico agrupado por categoría mediante INNER JOIN calculando el total de platos, el precio promedio y el promedio calórico
SELECT c.nombre_categoria AS categoria, c.descripcion_categoria, COUNT(p.id_plato) AS total_platos, CONCAT('$', FORMAT(AVG(p.precio), 2)) AS precio_promedio, ROUND(AVG(p.calorias), 0) AS calorias_promedio
FROM categorias_menu c
INNER JOIN platos_urbanos p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria, c.descripcion_categoria
ORDER BY total_platos DESC;

-- 3. Reporte filtrado mediante INNER JOIN para platos disponibles u ojeados como 'nuevo' ordenados de mayor a menor precio
SELECT p.codigo_plato, p.nombre_plato, c.nombre_categoria AS categoria, p.precio, p.calorias, p.estado_plato
FROM platos_urbanos p
INNER JOIN categorias_menu c ON p.id_categoria = c.id_categoria
WHERE p.estado_plato IN ('disponible', 'nuevo')
ORDER BY p.precio DESC;

-- 4. Top 5 de platos urbanos más costosos del menú utilizando INNER JOIN
SELECT p.codigo_plato, p.nombre_plato, c.nombre_categoria AS categoria, p.precio, p.calorias, p.estado_plato
FROM platos_urbanos p
INNER JOIN categorias_menu c ON p.id_categoria = c.id_categoria
ORDER BY p.precio DESC
LIMIT 5;

-- 5. Análisis cruzado por estado del plato evaluando la cantidad de productos, costo medio y aporte calórico acumulado con INNER JOIN
SELECT p.estado_plato, COUNT(*) AS cantidad_platos, CONCAT('$', FORMAT(AVG(p.precio), 2)) AS precio_promedio, SUM(p.calorias) AS calorias_totales_estado
FROM platos_urbanos p
INNER JOIN categorias_menu c ON p.id_categoria = c.id_categoria
GROUP BY p.estado_plato
ORDER BY cantidad_platos DESC;