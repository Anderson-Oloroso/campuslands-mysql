-- 1. Ver todos los estudiantes con JSON
SELECT * FROM `ejercicio-058-adv-estudiantes`;

-- 2. Extraer datos del JSON
SELECT nombre, 
       JSON_EXTRACT(progreso, '$.cursos') AS cursos,
       JSON_EXTRACT(progreso, '$.promedio') AS promedio
FROM `ejercicio-058-adv-estudiantes`;

-- 3. Filtrar por promedio mayor a 80
SELECT nombre, email
FROM `ejercicio-058-adv-estudiantes`
WHERE JSON_EXTRACT(progreso, '$.promedio') > 80;