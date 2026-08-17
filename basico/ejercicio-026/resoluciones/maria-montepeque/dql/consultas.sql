USE campuslands_mysql;

-- 1. Personajes activos ordenados por nivel
SELECT nombre, clase, nivel, vida_maxima
FROM personajes_basico
WHERE estado = 'activo'
ORDER BY nivel DESC;

-- 2. Personajes de una clase especifica
SELECT nombre, nivel, oro
FROM personajes_basico
WHERE clase = 'mago';

-- 3. Personajes de nivel avanzado (20 o mas)
SELECT nombre, clase, nivel
FROM personajes_basico
WHERE nivel >= 20
ORDER BY nivel DESC;

-- 4. Vida maxima promedio por clase
SELECT clase, COUNT(*) AS total_personajes, AVG(vida_maxima) AS vida_promedio
FROM personajes_basico
GROUP BY clase
ORDER BY vida_promedio DESC;

-- 5. Top 3 personajes con mas oro
SELECT nombre, clase, oro
FROM personajes_basico
ORDER BY oro DESC
LIMIT 3;

-- 6. Cantidad de personajes por estado
SELECT estado, COUNT(*) AS total
FROM personajes_basico
GROUP BY estado
ORDER BY total DESC;
