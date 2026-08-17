USE campuslands_mysql;

-- 1. Listado completo ordenado por precio
SELECT id_diseno, nombre, estilo, tamano, precio, disponible
FROM disenos_basico
ORDER BY precio DESC;

-- 2. Busqueda de disenos cuyo nombre contiene "Tradicional"
SELECT nombre, estilo, precio
FROM disenos_basico
WHERE nombre LIKE '%Tradicional%';

-- 3. Estilos distintos que maneja el estudio
SELECT DISTINCT estilo
FROM disenos_basico
ORDER BY estilo;

-- 4. Disenos disponibles de estilos japones o realismo
SELECT nombre, estilo, precio, disponible
FROM disenos_basico
WHERE estilo IN ('japones', 'realismo') AND disponible = TRUE;

-- 5. Disenos con precio entre 200 y 500
SELECT nombre, estilo, precio
FROM disenos_basico
WHERE precio BETWEEN 200 AND 500
ORDER BY precio;

-- 6. Top 3 disenos que mas horas de trabajo requieren
SELECT nombre, estilo, duracion_horas
FROM disenos_basico
ORDER BY duracion_horas DESC
LIMIT 3;
