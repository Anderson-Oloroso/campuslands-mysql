-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    i.instructor_id,
    i.nombre_instructor,
    i.licencia_numero,
    COUNT(s.salto_id) AS total_saltos_supervisados,
    COALESCE(SUM(s.precio_salto_usd), 0.00) AS ingresos_totales_generados_usd,
    COALESCE(ROUND(AVG(s.tiempo_caida_libre_segundos), 1), 0.0) AS promedio_caida_libre_seg
FROM instructores_paracaidismo i
INNER JOIN saltos_paracaidismo s ON i.instructor_id = s.instructor_id
GROUP BY i.instructor_id, i.nombre_instructor, i.licencia_numero
HAVING total_saltos_supervisados >= 2 AND ingresos_totales_generados_usd > 400.00
ORDER BY ingresos_totales_generados_usd DESC;

SELECT 
    c.centro_id,
    c.nombre_centro,
    c.ciudad,
    c.pais,
    COUNT(s.salto_id) AS cantidad_saltos,
    COALESCE(ROUND(AVG(s.altura_salto_pies), 2), 0.00) AS altura_promedio_pies,
    COALESCE(SUM(s.precio_salto_usd), 0.00) AS facturacion_total_usd
FROM centros_salto c
LEFT JOIN saltos_paracaidismo s ON c.centro_id = s.centro_id
GROUP BY c.centro_id, c.nombre_centro, c.ciudad, c.pais
HAVING cantidad_saltos >= 2 AND altura_promedio_pies >= 12000.00
ORDER BY cantidad_saltos DESC;