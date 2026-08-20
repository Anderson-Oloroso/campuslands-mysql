USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio descendentemente
SELECT moto_id, marca, modelo, cilindraje, precio, estado
FROM garaje_motos
ORDER BY precio DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT moto_id, marca, modelo, precio
FROM garaje_motos
WHERE estado = 'Activo';

-- 3. Agrupar por modelo y calcular total y promedio de precio
SELECT modelo, COUNT(*) AS total_registros, AVG(precio) AS promedio_valor
FROM garaje_motos
GROUP BY modelo
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio mayor a 2000
SELECT moto_id, marca, modelo, precio
FROM garaje_motos
WHERE precio > 2000.00
ORDER BY precio ASC;

-- 5. Seleccionar los 5 mejores registros según precio
SELECT moto_id, marca, modelo, precio
FROM garaje_motos
ORDER BY precio DESC
LIMIT 5;
