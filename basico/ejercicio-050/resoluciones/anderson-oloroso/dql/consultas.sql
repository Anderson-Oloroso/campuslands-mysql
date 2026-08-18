USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio descendentemente
SELECT tatuaje_id, nombre_diseno, estilo, tamanio_cm, precio, estado
FROM tatuajes_estudio
ORDER BY precio DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT tatuaje_id, nombre_diseno, estilo, precio
FROM tatuajes_estudio
WHERE estado = 'Activo';

-- 3. Agrupar por estilo y calcular total y promedio de precio
SELECT estilo, COUNT(*) AS total_registros, AVG(precio) AS promedio_valor
FROM tatuajes_estudio
GROUP BY estilo
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio mayor a 2000
SELECT tatuaje_id, nombre_diseno, estilo, precio
FROM tatuajes_estudio
WHERE precio > 2000.00
ORDER BY precio ASC;

-- 5. Seleccionar los 5 mejores registros según precio
SELECT tatuaje_id, nombre_diseno, estilo, precio
FROM tatuajes_estudio
ORDER BY precio DESC
LIMIT 5;
