-- 1. Ranking general por nivel
SELECT nombre, tipo, nivel,
       ROW_NUMBER() OVER (ORDER BY nivel DESC) AS ranking
FROM `ejercicio-027-adv-personajes`;

-- 2. Ranking por tipo (partición)
SELECT nombre, tipo, nivel,
       ROW_NUMBER() OVER (PARTITION BY tipo ORDER BY nivel DESC) AS ranking_tipo
FROM `ejercicio-027-adv-personajes`;

-- 3. Comparación con el promedio
SELECT nombre, tipo, misiones,
       AVG(misiones) OVER (PARTITION BY tipo) AS promedio_tipo
FROM `ejercicio-027-adv-personajes`;