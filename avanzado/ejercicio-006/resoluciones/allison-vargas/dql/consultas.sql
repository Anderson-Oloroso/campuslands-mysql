-- DQL: 5 Consultas con EXPLAIN para analizar los planes de ejecución de MySQL
USE campuslands_mysql;

-- 1. Análisis de búsqueda por Clave Primaria (Uso de índice PRIMARY - Constante)
EXPLAIN SELECT 
    auto_id,
    marca,
    modelo,
    precio_usd
FROM hiperdeportivos_avanzado
WHERE auto_id = 1;

-- 2. Análisis de búsqueda por marca utilizando índice secundario (idx_marca)
EXPLAIN SELECT 
    auto_id,
    modelo,
    velocidad_maxima_kmh,
    precio_usd
FROM hiperdeportivos_avanzado
WHERE marca = 'Bugatti';

-- 3. Análisis de búsqueda por estado y rango de precio (Aprovechamiento de idx_estado_precio)
EXPLAIN SELECT 
    auto_id,
    marca,
    modelo,
    precio_usd
FROM hiperdeportivos_avanzado
WHERE estado = 'disponible' AND precio_usd > 2000000.00;

-- 4. Análisis de consulta sobre campo sin índice (Full Table Scan / type ALL)
EXPLAIN SELECT 
    marca,
    modelo,
    velocidad_maxima_kmh
FROM hiperdeportivos_avanzado
WHERE velocidad_maxima_kmh > 400;

-- 5. Análisis de agregación con GROUP BY y ORDER BY sobre el catálogo
EXPLAIN SELECT 
    estado,
    COUNT(*) AS total_autos,
    ROUND(AVG(precio_usd), 2) AS precio_promedio
FROM hiperdeportivos_avanzado
GROUP BY estado
ORDER BY precio_promedio DESC;
