-- DQL: Consultas con la cláusula HAVING para aplicar filtros tras el GROUP BY
USE campuslands_mysql;

-- 1. Modalidades de salto con recaudación acumulada superior a .00
SELECT 
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(SUM(monto_usd), 2) AS recaudacion_total
FROM saltos_having
WHERE estado = 'realizado'
GROUP BY modalidad
HAVING recaudacion_total > 300.00
ORDER BY recaudacion_total DESC;

-- 2. Instructores con un promedio de altura de salto superior o igual a 12,000 pies
SELECT 
    instructor_nombre,
    COUNT(*) AS saltos_guiados,
    ROUND(AVG(altura_pies), 0) AS altura_promedio_pies
FROM saltos_having
WHERE estado = 'realizado'
GROUP BY instructor_nombre
HAVING altura_promedio_pies >= 12000
ORDER BY altura_promedio_pies DESC;

-- 3. Zonas de salto que han registrado más de 2 saltos efectivos
SELECT 
    zona_salto,
    COUNT(*) AS total_actividades,
    ROUND(SUM(monto_usd), 2) AS total_generado
FROM saltos_having
WHERE estado = 'realizado'
GROUP BY zona_salto
HAVING total_actividades > 2;

-- 4. Modalidades que tienen un precio o monto promedio por salto mayor a .00
SELECT 
    modalidad,
    COUNT(*) AS cantidad_saltos,
    ROUND(AVG(monto_usd), 2) AS ticket_promedio
FROM saltos_having
GROUP BY modalidad
HAVING ticket_promedio > 150.00
ORDER BY ticket_promedio DESC;

-- 5. Instructores que han generado más de .00 en ingresos totales
SELECT 
    instructor_nombre,
    COUNT(*) AS total_operaciones,
    ROUND(SUM(monto_usd), 2) AS facturacion_total
FROM saltos_having
WHERE estado = 'realizado'
GROUP BY instructor_nombre
HAVING facturacion_total > 400.00;
