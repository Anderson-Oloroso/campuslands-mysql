USE campuslands_mysql;

-- 1. Catalogo completo ordenado por precio
SELECT nombre, categoria, marca_compatible, precio, disponible
FROM repuestos_basico
ORDER BY precio DESC;

-- 2. Repuestos cuyo nombre contiene "Freno"
SELECT nombre, categoria, precio
FROM repuestos_basico
WHERE nombre LIKE '%Freno%';

-- 3. Categorias distintas que maneja el taller
SELECT DISTINCT categoria
FROM repuestos_basico
ORDER BY categoria;

-- 4. Repuestos disponibles de motor o frenos
SELECT nombre, categoria, precio
FROM repuestos_basico
WHERE categoria IN ('motor', 'frenos') AND disponible = TRUE;

-- 5. Repuestos con precio entre 20 y 70
SELECT nombre, categoria, precio
FROM repuestos_basico
WHERE precio BETWEEN 20 AND 70
ORDER BY precio;

-- 6. Top 3 repuestos mas caros
SELECT nombre, categoria, precio
FROM repuestos_basico
ORDER BY precio DESC
LIMIT 3;
