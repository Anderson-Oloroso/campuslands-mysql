-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT 
    e.codigo,
    e.titulo,
    e.dificultad,
    e.tematica,
    eq.codigo_equipo,
    eq.modelo,
    eq.estado AS estado_equipo,
    a.nombre AS area_trabajo
FROM ejercicios e
INNER JOIN equipos eq ON e.id_equipo = eq.id
INNER JOIN areas a ON eq.id_area = a.id
WHERE e.codigo = 'EJ-024';

SELECT 
    eq.codigo_equipo,
    eq.modelo,
    tb.codigo_bloqueo,
    tb.tipo AS tipo_bloqueo,
    rb.tecnico_responsable,
    rb.motivo,
    rb.fecha_bloqueo
FROM registros_bloqueo rb
INNER JOIN equipos eq ON rb.id_equipo = eq.id
INNER JOIN tipos_bloqueo tb ON rb.id_tipo_bloqueo = tb.id
WHERE rb.fecha_desbloqueo IS NULL;