USE campuslands_mysql;

-- 1. Cantidad total de formulas registradas.
SELECT
    COUNT(*) AS total_formulas
FROM formulas_quimicas;


-- 2. Cantidad total de muestras disponibles.
SELECT
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas;


-- 3. Cantidad de formulas por categoria.
SELECT
    categoria,
    COUNT(*) AS total_formulas
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_formulas DESC;


-- 4. Total de muestras por categoria.
SELECT
    categoria,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_muestras DESC;


-- 5. Cantidad de formulas y muestras de formulas activas.
SELECT
    COUNT(*) AS total_formulas_activas,
    SUM(cantidad_muestras) AS total_muestras_activas
FROM formulas_quimicas
WHERE estado = 'activa';