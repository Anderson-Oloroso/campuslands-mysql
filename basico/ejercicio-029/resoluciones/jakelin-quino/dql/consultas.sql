-- 1. Productos publicados en 2025
SELECT nombre, precio, fecha_publicacion 
FROM `ejercicio-029-bas-productos`
WHERE YEAR(fecha_publicacion) = 2025;

-- 2. Productos actualizados
SELECT nombre, fecha_publicacion, fecha_actualizacion
FROM `ejercicio-029-bas-productos`
WHERE fecha_actualizacion IS NOT NULL;

-- 3. Días entre publicacion y actualizacion
SELECT nombre, 
       DATEDIFF(fecha_actualizacion, fecha_publicacion) AS dias_diferencia
FROM `ejercicio-029-bas-productos`
WHERE fecha_actualizacion IS NOT NULL;