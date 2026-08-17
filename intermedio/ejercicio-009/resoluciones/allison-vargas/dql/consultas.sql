-- DQL: Consultas relacionales con JOIN para explotar la relación por FOREIGN KEY
USE campuslands_mysql;

-- 1. Listado general de practicantes con la información detallada de su Dojo asignado
SELECT 
    p.practicante_id,
    p.nombre_practicante,
    p.cinta,
    p.estado,
    d.nombre_dojo,
    d.entrenador_principal,
    d.ciudad
FROM practicantes_kickboxing p
INNER JOIN dojos_kickboxing d ON p.dojo_id = d.dojo_id
ORDER BY d.nombre_dojo, p.nombre_practicante;

-- 2. Recaudación mensual total por Dojo basada en cuotas de practicantes activos
SELECT 
    d.nombre_dojo,
    d.ciudad,
    COUNT(p.practicante_id) AS total_practicantes_activos,
    SUM(p.cuota_mensual) AS recaudacion_mensual
FROM dojos_kickboxing d
INNER JOIN practicantes_kickboxing p ON d.dojo_id = p.dojo_id
WHERE p.estado = 'activo'
GROUP BY d.dojo_id, d.nombre_dojo, d.ciudad
ORDER BY recaudacion_mensual DESC;

-- 3. Distribución de practicantes por nivel de cinta
SELECT 
    p.cinta,
    COUNT(p.practicante_id) AS total_practicantes,
    ROUND(AVG(p.cuota_mensual), 2) AS cuota_promedio
FROM practicantes_kickboxing p
GROUP BY p.cinta
ORDER BY total_practicantes DESC;

-- 4. Porcentaje de ocupación actual de los dojos según practicantes registrados
SELECT 
    d.nombre_dojo,
    d.capacidad_maxima,
    COUNT(p.practicante_id) AS practicantes_inscritos,
    ROUND((COUNT(p.practicante_id) / d.capacidad_maxima) * 100, 2) AS porcentaje_ocupacion
FROM dojos_kickboxing d
LEFT JOIN practicantes_kickboxing p ON d.dojo_id = p.dojo_id
GROUP BY d.dojo_id, d.nombre_dojo, d.capacidad_maxima;

-- 5. Consulta de practicantes avanzados (Cinta Negra, Roja o Marrón) con su dojo
SELECT 
    p.nombre_practicante,
    p.cinta,
    d.nombre_dojo,
    d.entrenador_principal
FROM practicantes_kickboxing p
INNER JOIN dojos_kickboxing d ON p.dojo_id = d.dojo_id
WHERE p.cinta IN ('Negra', 'Roja', 'Marrón') AND p.estado = 'activo';
