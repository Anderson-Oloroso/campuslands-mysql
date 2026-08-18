-- Consultas para Ejercicio 059 - fechas basicas para marketplace de accesorios
-- Concepto principal: fechas basicas
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM productos_accesorios;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM productos_accesorios;

-- 3. Consulta aplicando el concepto principal: fechas basicas
SELECT * FROM productos_accesorios
ORDER BY precio DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_producto, categoria, precio
FROM productos_accesorios
WHERE precio > (SELECT AVG(precio) FROM productos_accesorios)
ORDER BY precio DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(precio) AS promedio_valor,
    MIN(precio) AS valor_minimo,
    MAX(precio) AS valor_maximo
FROM productos_accesorios;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    categoria,
    COUNT(*) AS cantidad,
    AVG(precio) AS promedio
FROM productos_accesorios
GROUP BY categoria
ORDER BY cantidad DESC;
