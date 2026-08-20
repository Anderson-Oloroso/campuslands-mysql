USE campuslands_mysql;

-- 1. Contar el total de formulas registradas.
SELECT
    COUNT(*) AS total_formulas
FROM formulas_quimicas;


-- 2. Calcular la cantidad total de muestras registradas.
SELECT
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas;


-- 3. Contar las formulas activas.
SELECT
    COUNT(*) AS formulas_activas
FROM formulas_quimicas
WHERE estado = 'activa';


-- 4. Obtener la cantidad de formulas y muestras por categoria.
SELECT
    categoria,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_muestras DESC;


-- 5. Calcular el costo total de las muestras
--    considerando cantidad y costo individual.
SELECT
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras,
    SUM(cantidad_muestras * costo_muestra) AS costo_total_muestras
FROM formulas_quimicas
WHERE estado = 'activa';