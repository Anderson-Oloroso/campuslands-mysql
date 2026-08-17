USE campuslands_mysql;

-- 1. Catalogo completo ordenado por precio
SELECT nombre, estilo, tatuador, precio, disponible
FROM disenos_basico
ORDER BY precio DESC;

-- 2. Disenos cuyo nombre contiene "Dragon"
SELECT nombre, estilo, precio
FROM disenos_basico
WHERE nombre LIKE '%Dragon%';

-- 3. Estilos distintos que maneja el estudio
SELECT DISTINCT estilo
FROM disenos_basico
ORDER BY estilo;

-- 4. Disenos disponibles de estilo tradicional o realismo
SELECT nombre, estilo, precio
FROM disenos_basico
WHERE estilo IN ('tradicional', 'realismo') AND disponible = TRUE;

-- 5. Disenos con precio entre 150 y 260
SELECT nombre, estilo, precio
FROM disenos_basico
WHERE precio BETWEEN 150 AND 260
ORDER BY precio;

-- 6. Top 3 disenos mas caros
SELECT nombre, estilo, precio
FROM disenos_basico
ORDER BY precio DESC
LIMIT 3;
