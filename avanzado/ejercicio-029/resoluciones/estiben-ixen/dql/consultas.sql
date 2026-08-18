-- Consultas Avanzadas para Ejercicio 029 - event scheduler para marketplace de accesorios
-- Concepto principal: event scheduler
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.nombre_producto AS elemento,
        p.nombre_tienda AS categoria,
        s.precio AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_vendedor ORDER BY s.precio DESC) AS ranking
    FROM productos_accesorios s
    INNER JOIN vendedores_marketplace p ON s.id_vendedor = p.id_vendedor
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_tienda AS categoria_principal,
    COUNT(s.id_producto) AS cantidad_registros,
    AVG(s.precio) AS promedio_categoria,
    (AVG(s.precio) - (SELECT AVG(precio) FROM productos_accesorios)) AS diferencia_vs_global
FROM vendedores_marketplace p
INNER JOIN productos_accesorios s ON p.id_vendedor = s.id_vendedor
GROUP BY p.id_vendedor, p.nombre_tienda
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_producto AS nombre_destacado,
    p.nombre_tienda AS origen,
    s.precio AS metrica_maxima
FROM productos_accesorios s
INNER JOIN vendedores_marketplace p ON s.id_vendedor = p.id_vendedor
ORDER BY s.precio DESC
LIMIT 3;
