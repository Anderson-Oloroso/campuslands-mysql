USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio descendentemente
SELECT platillo_id, nombre_platillo, categoria, ingrediente_principal, precio, estado
FROM platillos_urbanos
ORDER BY precio DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT platillo_id, nombre_platillo, categoria, precio
FROM platillos_urbanos
WHERE estado = 'Activo';

-- 3. Agrupar por categoria y calcular total y promedio de precio
SELECT categoria, COUNT(*) AS total_registros, AVG(precio) AS promedio_valor
FROM platillos_urbanos
GROUP BY categoria
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio mayor a 2000
SELECT platillo_id, nombre_platillo, categoria, precio
FROM platillos_urbanos
WHERE precio > 2000.00
ORDER BY precio ASC;

-- 5. Seleccionar los 5 mejores registros según precio
SELECT platillo_id, nombre_platillo, categoria, precio
FROM platillos_urbanos
ORDER BY precio DESC
LIMIT 5;
