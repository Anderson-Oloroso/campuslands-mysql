USE campuslands_mysql;


-- 1. Mostrar las modalidades que tienen más de 3 saltos registrados.
SELECT
    modalidad,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY modalidad
HAVING COUNT(*) > 3
ORDER BY total_saltos DESC;


-- 2. Mostrar los niveles de experiencia cuyo precio promedio
-- sea superior a 300.
SELECT
    experiencia_nivel,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM saltos
GROUP BY experiencia_nivel
HAVING AVG(precio) > 300
ORDER BY precio_promedio DESC;


-- 3. Mostrar las modalidades cuyo precio total supere 1000.
SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(SUM(precio), 2) AS ingreso_total
FROM saltos
GROUP BY modalidad
HAVING SUM(precio) > 1000
ORDER BY ingreso_total DESC;


-- 4. Mostrar los niveles que tienen al menos 3 participantes.
SELECT
    experiencia_nivel,
    COUNT(*) AS total_participantes
FROM saltos
GROUP BY experiencia_nivel
HAVING COUNT(*) >= 3
ORDER BY total_participantes DESC;


-- 5. Mostrar las modalidades cuya altura promedio sea superior
-- a 11000 metros.
SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(AVG(altura_salto), 0) AS altura_promedio
FROM saltos
GROUP BY modalidad
HAVING AVG(altura_salto) > 11000
ORDER BY altura_promedio DESC;


-- 6. Mostrar los estados que tengan más de 2 registros.
SELECT
    estado,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY estado
HAVING COUNT(*) > 2
ORDER BY total_saltos DESC;


-- 7. Ranking de modalidades por cantidad de saltos,
-- mostrando únicamente modalidades con al menos 3 registros.
SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    ROUND(AVG(altura_salto), 0) AS altura_promedio
FROM saltos
GROUP BY modalidad
HAVING COUNT(*) >= 3
ORDER BY total_saltos DESC, precio_promedio DESC;