-- 1. Ver todos los destinos
SELECT * FROM `ejercicio-018-bas-destinos`;

-- 2. Destinos con precio menor a 1000
SELECT ciudad, pais, precio FROM `ejercicio-018-bas-destinos` WHERE precio < 1000;

-- 3. Destinos ordenados por precio
SELECT ciudad, pais, dias, precio FROM `ejercicio-018-bas-destinos` ORDER BY precio DESC;