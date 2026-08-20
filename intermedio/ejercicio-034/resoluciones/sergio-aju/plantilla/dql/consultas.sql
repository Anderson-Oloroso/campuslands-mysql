USE campuslands_mysql;

-- 1. Agrupar por marca y usar HAVING para mostrar solo marcas que tengan un inventario total mayor a 1 unidad
SELECT 
    marca,
    COUNT(*) AS total_motos,
    SUM(precio_comercial) AS valor_total_inventario
FROM garaje_motos_having
GROUP BY marca
HAVING COUNT(*) > 1
ORDER BY valor_total_inventario DESC;

-- 2. Agrupar por estado operativo y usar HAVING para mostrar estados cuyo valor promedio comercial supere los 6,000.00
SELECT 
    estado_motos,
    COUNT(*) AS cantidad_motos,
    ROUND(AVG(precio_comercial), 2) AS precio_promedio
FROM garaje_motos_having
GROUP BY estado_motos
HAVING AVG(precio_comercial) > 6000.00
ORDER BY precio_promedio DESC;

-- 3. Agrupar por marca y cilindrada promedio utilizando HAVING para filtrar marcas con cilindrada media mayor a 500 cc
SELECT 
    marca,
    COUNT(*) AS total_modelos,
    ROUND(AVG(cilindrada_cc), 2) AS cilindrada_promedio
FROM garaje_motos_having
GROUP BY marca
HAVING AVG(cilindrada_cc) > 500.00
ORDER BY cilindrada_promedio DESC;

-- 4. Combinar WHERE y HAVING: Filtrar motos fabricadas desde 2022 en adelante, agrupar por marca y retener aquellas con inversión acumulada mayor a 10,000.00
SELECT 
    marca,
    COUNT(*) AS motos_recientes,
    SUM(precio_comercial) AS inversion_acumulada
FROM garaje_motos_having
WHERE anio_fabricacion >= 2022
GROUP BY marca
HAVING SUM(precio_comercial) > 10000.00
ORDER BY inversion_acumulada DESC;

-- 5. Agrupar por estado operativo utilizando HAVING para mostrar solo aquellos estados que acumulen más de 2 motocicletas registradas
SELECT 
    estado_motos,
    COUNT(*) AS total_unidades,
    MAX(precio_comercial) AS moto_mas_cara_estado
FROM garaje_motos_having
GROUP BY estado_motos
HAVING COUNT(*) >= 2
ORDER BY total_unidades DESC;