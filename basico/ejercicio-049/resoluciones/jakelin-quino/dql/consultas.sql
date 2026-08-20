-- 1. Ver todos los saltos
SELECT * FROM `ejercicio-049-bas-saltos`;

-- 2. Paracaidistas con más de 20 saltos
SELECT nombre, saltos FROM `ejercicio-049-bas-saltos` WHERE saltos > 20;

-- 3. Ordenar por altura
SELECT nombre, altura, saltos FROM `ejercicio-049-bas-saltos` ORDER BY altura DESC;