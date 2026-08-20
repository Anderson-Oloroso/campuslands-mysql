-- 1. Ver todos los países
SELECT * FROM `ejercicio-023-int-paises`;

-- 2. Ciudades con su país
SELECT c.nombre AS ciudad, p.nombre AS pais, c.poblacion
FROM `ejercicio-023-int-ciudades` c
INNER JOIN `ejercicio-023-int-paises` p ON c.pais_id = p.id;

-- 3. Edificios con su ciudad y país
SELECT e.nombre AS edificio, c.nombre AS ciudad, p.nombre AS pais, e.altura
FROM `ejercicio-023-int-edificios` e
INNER JOIN `ejercicio-023-int-ciudades` c ON e.ciudad_id = c.id
INNER JOIN `ejercicio-023-int-paises` p ON c.pais_id = p.id;