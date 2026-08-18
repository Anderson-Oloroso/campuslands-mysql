-- 1. Ver todos los personajes
SELECT * FROM `ejercicio-026-bas-personajes`;

-- 2. Personajes por clase
SELECT clase, COUNT(*) AS total FROM `ejercicio-026-bas-personajes`
GROUP BY clase;

-- 3. Personajes con nivel mayor a 10
SELECT nombre, nivel, clase FROM `ejercicio-026-bas-personajes`
WHERE nivel > 10;