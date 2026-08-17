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
