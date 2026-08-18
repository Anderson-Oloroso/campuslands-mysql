-- 1. Ciudades con promedio de saltos mayor a 20
SELECT ciudad, AVG(saltos) AS promedio_saltos
FROM `ejercicio-049-int-saltos`
GROUP BY ciudad
HAVING promedio_saltos > 20;

-- 2. Ciudades con más de 2 paracaidistas
SELECT ciudad, COUNT(*) AS total
FROM `ejercicio-049-int-saltos`
GROUP BY ciudad
HAVING total > 2;

-- 3. Alturas con promedio mayor a 3800
SELECT ciudad, AVG(altura) AS promedio_altura
FROM `ejercicio-049-int-saltos`
GROUP BY ciudad
HAVING promedio_altura > 3800;