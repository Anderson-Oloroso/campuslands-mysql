USE campuslands_mysql;

-- 1. Listado completo ordenado por categoria y precio
SELECT id_platillo, nombre, categoria, precio, estado
FROM platillos_urbanos_basico
ORDER BY categoria, precio DESC;

-- 2. Platillos disponibles ordenados del mas caro al mas barato
SELECT nombre, categoria, precio
FROM platillos_urbanos_basico
WHERE estado = 'disponible'
ORDER BY precio DESC;

-- 3. Total de platillos y precio promedio por categoria
SELECT categoria, COUNT(*) AS total_platillos, AVG(precio) AS precio_promedio
FROM platillos_urbanos_basico
GROUP BY categoria
ORDER BY precio_promedio DESC;

-- 4. Top 3 platillos mas caros del menu
SELECT nombre, categoria, precio
FROM platillos_urbanos_basico
ORDER BY precio DESC
LIMIT 3;

-- 5. Platillos que no se pueden vender ahora mismo
SELECT nombre, categoria, estado
FROM platillos_urbanos_basico
WHERE estado IN ('agotado', 'descontinuado');

-- 6. Ranking de categorias por cantidad de platillos disponibles
SELECT categoria, COUNT(*) AS disponibles
FROM platillos_urbanos_basico
WHERE estado = 'disponible'
GROUP BY categoria
ORDER BY disponibles DESC;
