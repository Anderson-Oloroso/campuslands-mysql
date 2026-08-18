USE campuslands_mysql;

SELECT
    COUNT(*) AS total_formulas
FROM formulas_quimicas;


SELECT
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas;

SELECT
    COUNT(*) AS formulas_activas
FROM formulas_quimicas
WHERE estado = 'activa';

SELECT
    SUM(cantidad_muestras * costo_muestra) AS costo_total_muestras
FROM formulas_quimicas;

SELECT
    categoria,
    COUNT(*) AS total_formulas
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_formulas DESC;

SELECT
    categoria,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_muestras DESC;

SELECT
    categoria,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras,
    SUM(cantidad_muestras * costo_muestra) AS costo_total
FROM formulas_quimicas
GROUP BY categoria
ORDER BY costo_total DESC;