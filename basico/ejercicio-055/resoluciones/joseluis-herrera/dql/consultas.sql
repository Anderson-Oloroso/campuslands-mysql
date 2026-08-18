USE campuslands_mysql;

SELECT
    COUNT(*) AS total_formulas
FROM formulas_quimicas;

SELECT
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas;

SELECT
    SUM(cantidad_reactivo) AS total_reactivo
FROM formulas_quimicas;

SELECT
    categoria,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_formulas DESC;

SELECT
    categoria,
    COUNT(*) AS formulas_activas,
    SUM(cantidad_reactivo) AS reactivo_utilizado
FROM formulas_quimicas
WHERE estado = 'activa'
GROUP BY categoria
ORDER BY reactivo_utilizado DESC;

SELECT
    estado,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY estado
ORDER BY total_muestras DESC;