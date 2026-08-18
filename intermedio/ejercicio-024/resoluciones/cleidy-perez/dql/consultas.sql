-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT 
    e.codigo AS codigo_ejercicio,
    e.titulo AS ejercicio,
    e.dificultad,
    eq.codigo_equipo,
    eq.modelo AS equipo,
    a.nombre AS area_ubicacion
FROM ejercicios e
INNER JOIN equipos eq ON e.id_equipo = eq.id
INNER JOIN areas a ON eq.id_area = a.id
WHERE e.codigo = 'EJ-024';
