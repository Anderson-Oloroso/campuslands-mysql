-- 1. Ver todos los platos del menú
SELECT * FROM `ejercicio-016-bas-platos`;

-- 2. Ver platos disponibles
SELECT nombre, precio FROM `ejercicio-016-bas-platos` WHERE disponible=1;

-- 3. Conteo de platos por categoría
SELECT categoria, COUNT(*) AS total FROM `ejercicio-016-bas-platos` GROUP BY categoria;