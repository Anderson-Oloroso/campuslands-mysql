-- 1. Ver todos los personajes
SELECT * FROM `ejercicio-056-int-personajes`;

-- 2. Ver estructura de la tabla
SHOW CREATE TABLE `ejercicio-056-int-personajes`;

-- 3. Personajes con ataque mayor a 25
SELECT nombre, nivel, ataque, defensa 
FROM `ejercicio-056-int-personajes` 
WHERE ataque > 25;