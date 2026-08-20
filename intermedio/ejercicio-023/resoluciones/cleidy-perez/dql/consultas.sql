-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT 
    e.codigo,
    e.titulo,
    e.dificultad,
    t.nombre AS tematica,
    i.nombre AS instructor
FROM ejercicios e
INNER JOIN tematicas t ON e.id_tematica = t.id
INNER JOIN instructores i ON e.id_instructor = i.id
WHERE e.codigo = 'EJ-023';

SELECT 
    e.codigo,
    est.nombre AS estudiante,
    ent.estado,
    ent.calificacion,
    ent.url_render
FROM entregas ent
INNER JOIN ejercicios e ON ent.id_ejercicio = e.id
INNER JOIN estudiantes est ON ent.id_estudiante = est.id
WHERE e.codigo = 'EJ-023'
ORDER BY ent.calificacion DESC;