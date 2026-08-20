USE campuslands_mysql;

-- 1. Listar todos los diseños disponibles ordenados por precio descendente
SELECT 
    id,
    nombre_diseno,
    estilo,
    duracion_estimada_horas,
    precio,
    calificacion
FROM disenos_tatuajes
WHERE estado = 'disponible'
ORDER BY precio DESC;

-- 2. Conteo de diseños y precio promedio agrupado por estilo
SELECT 
    estilo,
    COUNT(*) AS total_disenos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM disenos_tatuajes
WHERE estado = 'disponible'
GROUP BY estilo;

-- 3. Top 3 diseños con mejor calificación disponibles
SELECT 
    nombre_diseno,
    estilo,
    precio,
    calificacion
FROM disenos_tatuajes
WHERE estado = 'disponible'
ORDER BY calificacion DESC
LIMIT 3;

-- 4. Filtrar diseños con precio menor a $260.00 y duración máxima de 3.5 horas
SELECT 
    nombre_diseno,
    estilo,
    duracion_estimada_horas,
    precio
FROM disenos_tatuajes
WHERE precio < 260.00 
  AND duracion_estimada_horas <= 3.5 
  AND estado = 'disponible';

-- 5. Reporte de diseños no disponibles (reservados o inactivos)
SELECT 
    id,
    nombre_diseno,
    estilo,
    estado
FROM disenos_tatuajes
WHERE estado IN ('reservado', 'inactivo');