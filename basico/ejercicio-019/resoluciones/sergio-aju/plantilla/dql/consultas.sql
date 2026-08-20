USE campuslands_mysql;

-- 1. Listar saltos activos ordenados por altura descendente
SELECT 
    id,
    modalidad,
    altura_pies,
    precio,
    nivel_experiencia,
    calificacion
FROM saltos_paracaidismo
WHERE estado = 'activo'
ORDER BY altura_pies DESC;

-- 2. Conteo de saltos y precio promedio agrupados por nivel de experiencia
SELECT 
    nivel_experiencia,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM saltos_paracaidismo
WHERE estado = 'activo'
GROUP BY nivel_experiencia;

-- 3. Top 3 saltos con mejor calificación para principiantes
SELECT 
    modalidad,
    altura_pies,
    precio,
    calificacion
FROM saltos_paracaidismo
WHERE nivel_experiencia = 'Principiante' AND estado = 'activo'
ORDER BY calificacion DESC
LIMIT 3;

-- 4. Filtrar saltos con altura mayor o igual a 13,000 pies y precio menor a $300.00
SELECT 
    modalidad,
    altura_pies,
    precio,
    nivel_experiencia
FROM saltos_paracaidismo
WHERE altura_pies >= 13000 AND precio < 300.00 AND estado = 'activo';

-- 5. Listar modalidades inactivas o de baja calificación (< 4.0)
SELECT 
    id,
    modalidad,
    precio,
    calificacion,
    estado
FROM saltos_paracaidismo
WHERE estado = 'inactivo' OR calificacion < 4.00;