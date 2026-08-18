-- Consultas con HAVING sobre saltos_paracaidismo.
USE campuslands_mysql;

-- 1. Cantidad de saltos y altura promedio por instructor
SELECT instructor, COUNT(*) AS total_saltos, ROUND(AVG(altura_metros), 2) AS altura_promedio
FROM saltos_paracaidismo
GROUP BY instructor
ORDER BY total_saltos DESC;

-- 2. Instructores con mas de 3 saltos registrados (filtro sobre el agregado)
SELECT instructor, COUNT(*) AS total_saltos
FROM saltos_paracaidismo
GROUP BY instructor
HAVING COUNT(*) > 3
ORDER BY total_saltos DESC;

-- 3. Instructores cuya altura promedio de salto supera los 3700 metros
SELECT instructor, ROUND(AVG(altura_metros), 2) AS altura_promedio
FROM saltos_paracaidismo
GROUP BY instructor
HAVING AVG(altura_metros) > 3700
ORDER BY altura_promedio DESC;

-- 4. Clientes que han saltado con mas de un instructor distinto
SELECT cliente, COUNT(DISTINCT instructor) AS instructores_distintos
FROM saltos_paracaidismo
GROUP BY cliente
HAVING COUNT(DISTINCT instructor) > 1
ORDER BY instructores_distintos DESC;

-- 5. Duracion total de caida por instructor, solo si supera los 90 segundos acumulados
SELECT instructor, SUM(duracion_caida_segundos) AS duracion_total
FROM saltos_paracaidismo
GROUP BY instructor
HAVING SUM(duracion_caida_segundos) > 90
ORDER BY duracion_total DESC;
