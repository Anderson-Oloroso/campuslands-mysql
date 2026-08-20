USE campuslands_mysql;

-- 1. Paracaidistas con más de 2 saltos completados (Uso de HAVING con COUNT)
SELECT 
    p.id AS paracaidista_id,
    CONCAT(p.nombre, ' ', p.apellido) AS paracaidista,
    p.licencia,
    COUNT(s.id) AS total_saltos_completados
FROM paracaidistas p
INNER JOIN saltos s ON p.id = s.paracaidista_id
WHERE s.estado_salto = 'Completado'
GROUP BY p.id, p.nombre, p.apellido, p.licencia
HAVING COUNT(s.id) >= 2
ORDER BY total_saltos_completados DESC;

-- 2. Dropzones cuyo promedio de tiempo en caída libre sea superior a 50 segundos (Uso de HAVING con AVG)
SELECT 
    z.nombre_dropzone,
    z.ubicacion,
    COUNT(s.id) AS total_saltos,
    ROUND(AVG(s.tiempo_caida_libre_seg), 2) AS promedio_caida_libre_seg
FROM zonas_salto z
INNER JOIN saltos s ON z.id = s.dropzone_id
WHERE s.estado_salto = 'Completado'
GROUP BY z.id, z.nombre_dropzone, z.ubicacion
HAVING AVG(s.tiempo_caida_libre_seg) > 50.00
ORDER BY promedio_caida_libre_seg DESC;

-- 3. Modalidades de salto que hayan acumulado una facturación total mayor a $400 (Uso de HAVING con SUM)
SELECT 
    s.modalidad,
    COUNT(s.id) AS cantidad_saltos,
    SUM(s.costo) AS facturacion_total,
    ROUND(AVG(s.altitud_pies), 0) AS altitud_promedio_pies
FROM saltos s
WHERE s.estado_salto = 'Completado'
GROUP BY s.modalidad
HAVING SUM(s.costo) > 400.00
ORDER BY facturacion_total DESC;

-- 4. Instructores que han supervisado al menos 2 saltos exitosos con ganancias generadas mayores a $350 (Uso de HAVING con condiciones compuestas)
SELECT 
    i.id AS instructor_id,
    CONCAT(i.nombre, ' ', i.apellido) AS instructor,
    i.licencia_instructor,
    COUNT(s.id) AS saltos_supervisados,
    SUM(s.costo) AS ingresos_generados
FROM instructores i
INNER JOIN saltos s ON i.id = s.instructor_id
WHERE s.estado_salto = 'Completado'
GROUP BY i.id, i.nombre, i.apellido, i.licencia_instructor
HAVING COUNT(s.id) >= 2 AND SUM(s.costo) > 350.00
ORDER BY ingresos_generados DESC;

-- 5. Paracaidistas cuyo gasto promedio por salto supere los $220 y cuya altitud máxima haya alcanzado o superado los 13,000 pies
SELECT 
    p.id AS paracaidista_id,
    CONCAT(p.nombre, ' ', p.apellido) AS paracaidista,
    COUNT(s.id) AS total_saltos,
    MAX(s.altitud_pies) AS altitud_maxima_alcanzada,
    ROUND(AVG(s.costo), 2) AS gasto_promedio_salto
FROM paracaidistas p
INNER JOIN saltos s ON p.id = s.paracaidista_id
WHERE s.estado_salto = 'Completado'
GROUP BY p.id, p.nombre, p.apellido
HAVING AVG(s.costo) > 220.00 AND MAX(s.altitud_pies) >= 13000
ORDER BY gasto_promedio_salto DESC;