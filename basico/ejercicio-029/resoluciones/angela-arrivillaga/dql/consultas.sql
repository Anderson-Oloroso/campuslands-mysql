USE marketplace_accesorios_db;

-- 1. Consultar accesorios lanzados durante el año 2026 utilizando funciones de fecha (YEAR) y ordenados por fecha reciente
SELECT codigo_accesorio, nombre_accesorio, categoria_accesorio, precio_usd, fecha_lanzamiento, estado_inventario
FROM accesorios_marketplace
WHERE YEAR(fecha_lanzamiento) = 2026
ORDER BY fecha_lanzamiento DESC;

-- 2. Consultar accesorios lanzados en un mes específico (ejemplo: mes de febrero, 02) utilizando la función MONTH
SELECT codigo_accesorio, nombre_accesorio, categoria_accesorio, precio_usd, fecha_lanzamiento, estado_inventario
FROM accesorios_marketplace
WHERE MONTH(fecha_lanzamiento) = 2
ORDER BY fecha_lanzamiento ASC;

-- 3. Calcular la antigüedad en días de cada accesorio respecto a la fecha actual utilizando DATEDIFF y CURDATE
SELECT 
    codigo_accesorio,
    nombre_accesorio,
    fecha_lanzamiento,
    DATEDIFF(CURDATE(), fecha_lanzamiento) AS dias_desde_lanzamiento
FROM accesorios_marketplace
ORDER BY dias_desde_lanzamiento ASC;

-- 4. Filtrar accesorios lanzados dentro de un rango de fechas específico usando el operador BETWEEN
SELECT codigo_accesorio, nombre_accesorio, categoria_accesorio, precio_usd, fecha_lanzamiento, estado_inventario
FROM accesorios_marketplace
WHERE fecha_lanzamiento BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY fecha_lanzamiento DESC;

-- 5. Reporte analítico temporal y financiero agrupado por categoría de accesorios: total de productos, precio promedio y fecha del lanzamiento más reciente
SELECT 
    categoria_accesorio,
    COUNT(*) AS total_productos,
    CONCAT('$', FORMAT(AVG(precio_usd), 2)) AS precio_promedio_usd,
    MAX(fecha_lanzamiento) AS ultimo_lanzamiento
FROM accesorios_marketplace
GROUP BY categoria_accesorio
ORDER BY total_productos DESC;