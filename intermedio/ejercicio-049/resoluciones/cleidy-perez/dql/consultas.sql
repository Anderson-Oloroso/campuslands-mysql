-- Consultas base. Completa o reemplaza segun el enunciado.
USE escuela_paracaidismo;

-- Consulta 1: Instructores con más de 2 saltos realizados y un total facturado mayor a $500
SELECT 
    i.instructor_id,
    i.nombre AS instructor,
    COUNT(s.salto_id) AS total_saltos,
    SUM(s.precio) AS ingresos_totales
FROM instructores i
JOIN saltos s ON i.instructor_id = s.instructor_id
GROUP BY i.instructor_id, i.nombre
HAVING COUNT(s.salto_id) >= 2 AND SUM(s.precio) > 500.00;

-- Consulta 2: Paracaidistas con un promedio de altitud alcanzada superior a los 11,000 pies
SELECT 
    p.paracaidista_id,
    p.nombre AS paracaidista,
    p.nivel_experiencia,
    COUNT(s.salto_id) AS saltos_realizados,
    ROUND(AVG(s.altitud_pies), 0) AS altitud_promedio_pies
FROM paracaidistas p
JOIN saltos s ON p.paracaidista_id = s.paracaidista_id
GROUP BY p.paracaidista_id, p.nombre, p.nivel_experiencia
HAVING AVG(s.altitud_pies) > 11000;
