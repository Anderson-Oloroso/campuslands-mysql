-- Consultas Avanzadas para Ejercicio 033 - funciones SQL para inventario de skins shooter
-- Concepto principal: funciones SQL
USE campuslands_mysql;

-- 1. Consulta utilizando la Funcion Almacenada personalizada
SELECT 
    s.nombre_skin AS nombre_elemento,
    s.precio AS valor_metrica,
    fn_calcular_rendimiento_skins_shooter(s.precio) AS nivel_calculado
FROM skins_inventario s
ORDER BY s.precio DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_skin) AS cantidad_registros,
    AVG(s.precio) AS promedio_categoria,
    (AVG(s.precio) - (SELECT AVG(precio) FROM skins_inventario)) AS diferencia_vs_global
FROM armas_shooter p
INNER JOIN skins_inventario s ON p.id_arma = s.id_arma
GROUP BY p.id_arma, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_skin AS nombre_destacado,
    p.nombre AS origen,
    s.precio AS metrica_maxima
FROM skins_inventario s
INNER JOIN armas_shooter p ON s.id_arma = p.id_arma
ORDER BY s.precio DESC
LIMIT 3;
