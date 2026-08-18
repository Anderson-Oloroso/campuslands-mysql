USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio_usd descendentemente
SELECT auto_id, marca, modelo, caballos_fuerza, precio_usd, estado
FROM autos_hiperdeportivos
ORDER BY precio_usd DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT auto_id, marca, modelo, precio_usd
FROM autos_hiperdeportivos
WHERE estado = 'Activo';

-- 3. Agrupar por modelo y calcular total y promedio de precio_usd
SELECT modelo, COUNT(*) AS total_registros, AVG(precio_usd) AS promedio_valor
FROM autos_hiperdeportivos
GROUP BY modelo
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio_usd mayor a 2000
SELECT auto_id, marca, modelo, precio_usd
FROM autos_hiperdeportivos
WHERE precio_usd > 2000.00
ORDER BY precio_usd ASC;

-- 5. Seleccionar los 5 mejores registros según precio_usd
SELECT auto_id, marca, modelo, precio_usd
FROM autos_hiperdeportivos
ORDER BY precio_usd DESC
LIMIT 5;
