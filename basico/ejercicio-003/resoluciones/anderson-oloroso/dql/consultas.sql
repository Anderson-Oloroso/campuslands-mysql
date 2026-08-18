USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por cadencia descendentemente
SELECT arma_id, nombre_arma, tipo_arma, daño_base, cadencia, estado
FROM armas_shooter
ORDER BY cadencia DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT arma_id, nombre_arma, tipo_arma, cadencia
FROM armas_shooter
WHERE estado = 'Activo';

-- 3. Agrupar por tipo_arma y calcular total y promedio de cadencia
SELECT tipo_arma, COUNT(*) AS total_registros, AVG(cadencia) AS promedio_valor
FROM armas_shooter
GROUP BY tipo_arma
ORDER BY promedio_valor DESC;

-- 4. Filtrar por cadencia mayor a 2000
SELECT arma_id, nombre_arma, tipo_arma, cadencia
FROM armas_shooter
WHERE cadencia > 2000.00
ORDER BY cadencia ASC;

-- 5. Seleccionar los 5 mejores registros según cadencia
SELECT arma_id, nombre_arma, tipo_arma, cadencia
FROM armas_shooter
ORDER BY cadencia DESC
LIMIT 5;
