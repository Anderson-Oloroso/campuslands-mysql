-- DQL: Consultas de verificación, cálculo de precios finales e indicadores de carga
USE campuslands_mysql;

-- 1. Reporte de catálogo con cálculo del precio final aplicando el descuento
SELECT 
    codigo_sku,
    titulo,
    plataforma,
    formato,
    precio_tienda,
    CONCAT(descuento_porcentaje, '%') AS descuento,
    ROUND(precio_tienda * (1 - (descuento_porcentaje / 100)), 2) AS precio_final_usd
FROM carga_biblioteca_gamer
ORDER BY precio_final_usd ASC;

-- 2. Resumen de inventario y valor total del stock por plataforma
SELECT 
    plataforma,
    COUNT(*) AS total_titulos,
    SUM(stock_disponible) AS stock_total_unidades,
    ROUND(SUM(precio_tienda * stock_disponible), 2) AS valor_inventario_bruto_usd
FROM carga_biblioteca_gamer
GROUP BY plataforma
ORDER BY stock_total_unidades DESC;

-- 3. Filtrado de artículos físicos con stock crítico (menor o igual a 50 unidades)
SELECT 
    codigo_sku,
    titulo,
    plataforma,
    stock_disponible
FROM carga_biblioteca_gamer
WHERE formato = 'fisico' AND stock_disponible <= 50
ORDER BY stock_disponible ASC;

-- 4. Top 3 de videojuegos digitales con mayor descuento promocional
SELECT 
    titulo,
    plataforma,
    precio_tienda,
    descuento_porcentaje
FROM carga_biblioteca_gamer
WHERE formato = 'digital' AND descuento_porcentaje > 0
ORDER BY descuento_porcentaje DESC
LIMIT 3;

-- 5. Promedio de precios y total de títulos por formato de distribución (físico vs digital)
SELECT 
    formato,
    COUNT(*) AS total_juegos,
    ROUND(AVG(precio_tienda), 2) AS precio_promedio
FROM carga_biblioteca_gamer
GROUP BY formato;
