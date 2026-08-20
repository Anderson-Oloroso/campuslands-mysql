-- 1. Total de compuestos
SELECT COUNT(*) AS total_compuestos FROM `ejercicio-055-bas-compuestos`;

-- 2. Suma total de cantidad
SELECT SUM(cantidad) AS cantidad_total FROM `ejercicio-055-bas-compuestos`;

-- 3. Conteo y suma por tipo
SELECT tipo, COUNT(*) AS total, SUM(cantidad) AS cantidad_total
FROM `ejercicio-055-bas-compuestos`
GROUP BY tipo;