-- 1. CTE: personajes con poder alto
WITH poderosos AS (
    SELECT nombre, nivel, (ataque + defensa) AS poder
    FROM `ejercicio-026-adv-personajes`
    WHERE nivel > 10
)
SELECT * FROM poderosos ORDER BY poder DESC;

-- 2. CTE: promedio de nivel
WITH promedio AS (
    SELECT AVG(nivel) AS nivel_prom FROM `ejercicio-026-adv-personajes`
)
SELECT nombre, nivel 
FROM `ejercicio-026-adv-personajes`
WHERE nivel > (SELECT nivel_prom FROM promedio);

-- 3. CTE: ranking por nivel
WITH ranking AS (
    SELECT nombre, nivel,
           ROW_NUMBER() OVER (ORDER BY nivel DESC) AS posicion
    FROM `ejercicio-026-adv-personajes`
)
SELECT * FROM ranking WHERE posicion <= 3;