-- Consultas base. Completa o reemplaza segun el enunciado.
-- Actualizar el título y la dificultad del Ejercicio 022
UPDATE ejercicios 
SET 
    titulo = 'normalizacion 2FN para animacion 3D', 
    dificultad = 'Intermedio aplicado' 
WHERE codigo = 'EJ-022';

SELECT 
    e.codigo, 
    e.titulo, 
    e.dificultad, 
    t.nombre AS tematica,
    e.instrucciones
FROM ejercicios e
INNER JOIN tematicas t ON e.id_tematica = t.id
WHERE e.codigo = 'EJ-022';