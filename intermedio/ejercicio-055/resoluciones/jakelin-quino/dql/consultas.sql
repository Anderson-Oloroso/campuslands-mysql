-- 1. Ver todos los compuestos
SELECT * FROM `ejercicio-055-int-compuestos`;

-- 2. Ver índices UNIQUE
SHOW INDEX FROM `ejercicio-055-int-compuestos` WHERE Non_unique = 0;

-- 3. Verificar compuestos por tipo
SELECT tipo, COUNT(*) AS total FROM `ejercicio-055-int-compuestos`
GROUP BY tipo;