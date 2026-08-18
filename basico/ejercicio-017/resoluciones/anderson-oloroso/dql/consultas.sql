USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio descendentemente
SELECT prenda_id, nombre_prenda, categoria, talla, precio, estado
FROM prendas_ropa
ORDER BY precio DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT prenda_id, nombre_prenda, categoria, precio
FROM prendas_ropa
WHERE estado = 'Activo';

-- 3. Agrupar por categoria y calcular total y promedio de precio
SELECT categoria, COUNT(*) AS total_registros, AVG(precio) AS promedio_valor
FROM prendas_ropa
GROUP BY categoria
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio mayor a 2000
SELECT prenda_id, nombre_prenda, categoria, precio
FROM prendas_ropa
WHERE precio > 2000.00
ORDER BY precio ASC;

-- 5. Seleccionar los 5 mejores registros según precio
SELECT prenda_id, nombre_prenda, categoria, precio
FROM prendas_ropa
ORDER BY precio DESC
LIMIT 5;
