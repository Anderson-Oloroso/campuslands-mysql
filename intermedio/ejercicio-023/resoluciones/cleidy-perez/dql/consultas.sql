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
