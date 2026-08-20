-- Consultas Avanzadas para Ejercicio 046 - transacciones para restaurante de comida urbana
-- Concepto principal: transacciones
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.nombre_platillo AS elemento,
        p.nombre_categoria AS categoria,
        s.tiempo_preparacion_min AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_categoria ORDER BY s.tiempo_preparacion_min DESC) AS ranking
    FROM platillos_urbanos s
    INNER JOIN categorias_menu p ON s.id_categoria = p.id_categoria
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_categoria AS categoria_principal,
    COUNT(s.id_platillo) AS cantidad_registros,
    AVG(s.tiempo_preparacion_min) AS promedio_categoria,
    (AVG(s.tiempo_preparacion_min) - (SELECT AVG(tiempo_preparacion_min) FROM platillos_urbanos)) AS diferencia_vs_global
FROM categorias_menu p
INNER JOIN platillos_urbanos s ON p.id_categoria = s.id_categoria
GROUP BY p.id_categoria, p.nombre_categoria
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_platillo AS nombre_destacado,
    p.nombre_categoria AS origen,
    s.tiempo_preparacion_min AS metrica_maxima
FROM platillos_urbanos s
INNER JOIN categorias_menu p ON s.id_categoria = p.id_categoria
ORDER BY s.tiempo_preparacion_min DESC
LIMIT 3;
