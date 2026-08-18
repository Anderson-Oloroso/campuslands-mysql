-- 1. Ver todos los personajes
SELECT * FROM `ejercicio-057-bas-personajes`;

-- 2. Personajes por tipo
SELECT tipo, COUNT(*) AS total FROM `ejercicio-057-bas-personajes`
GROUP BY tipo;

-- 3. Personajes con nivel mayor a 15
SELECT nombre, nivel, tipo FROM `ejercicio-057-bas-personajes`
WHERE nivel > 15;