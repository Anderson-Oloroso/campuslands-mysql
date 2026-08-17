-- Consultas base. Completa o reemplaza segun el enunciado.

SELECT 
    e.codigo, 
    e.titulo, 
    e.dificultad, 
    t.nombre AS tematica
FROM ejercicios e
INNER JOIN tematicas t ON e.id_tematica = t.id
WHERE e.codigo = 'EJ-022';