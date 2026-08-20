USE campuslands_mysql;

-- 1. Listar todo el inventario del garaje ordenado por el valor comercial de mayor a menor
SELECT 
    id,
    placa,
    marca,
    modelo,
    cilindrada_cc,
    precio_comercial,
    estado_motos
FROM garaje_motos
ORDER BY precio_comercial DESC;

-- 2. Filtrar únicamente las motocicletas que se encuentran disponibles para alquiler o venta
SELECT 
    placa,
    marca,
    modelo,
    cilindrada_cc,
    anio_fabricacion,
    precio_comercial
FROM garaje_motos
WHERE estado_motos = 'disponible'
ORDER BY cilindrada_cc DESC;

-- 3. Agrupación por marca de moto para conocer el total de unidades y el valor promedio del mercado
SELECT 
    marca,
    COUNT(*) AS total_motos,
    SUM(precio_comercial) AS valor_total_inventario,
    ROUND(AVG(precio_comercial), 2) AS precio_promedio
FROM garaje_motos
GROUP BY marca
ORDER BY total_motos DESC;

-- 4. Top 3 de las motocicletas con mayor cilindrada (alta potencia) registradas en el garaje
SELECT 
    marca,
    modelo,
    cilindrada_cc,
    anio_fabricacion,
    estado_motos
FROM garaje_motos
ORDER BY cilindrada_cc DESC
LIMIT 3;

-- 5. Reporte analítico agrupado por el estado operativo de las motos en el garaje
SELECT 
    estado_motos,
    COUNT(*) AS cantidad_unidades,
    ROUND(AVG(cilindrada_cc), 2) AS promedio_cilindrada
FROM garaje_motos
GROUP BY estado_motos
ORDER BY cantidad_unidades DESC;