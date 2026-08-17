-- Consultas base. Completa o reemplaza segun el enunciado.
USE plattform_animacion;
SELECT 
    e.codigo, 
    e.titulo, 
    e.dificultad, 
    t.nombre AS tematica
FROM ejercicios e
INNER JOIN tematicas t ON e.id_tematica = t.id
WHERE e.codigo = 'EJ-022';

SELECT 
    e.codigo,
    e.titulo,
    ent.nombre_alumno,
    ent.estado,
    ent.calificacion,
    ent.fecha_entrega
FROM entregas ent
INNER JOIN ejercicios e ON ent.id_ejercicio = e.id
WHERE e.codigo = 'EJ-022';