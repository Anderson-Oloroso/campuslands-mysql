USE campuslands_mysql;

-- 1. Citas cuyo costo total es superior al costo promedio general de todas las citas completadas
SELECT 
    c.id AS cita_id,
    c.cliente,
    c.estilo_diseno,
    c.costo_total,
    (SELECT ROUND(AVG(costo_total), 2) FROM citas_tatuajes WHERE estado_cita = 'completada') AS promedio_general
FROM citas_tatuajes c
WHERE c.costo_total > (
    SELECT AVG(costo_total) 
    FROM citas_tatuajes 
    WHERE estado_cita = 'completada'
)
AND c.estado_cita = 'completada';

-- 2. Tatuadores cuya tarifa por hora es mayor a la tarifa promedio de todos los tatuadores activos
SELECT 
    id,
    nombre,
    especialidad,
    tarifa_por_hora
FROM tatuadores
WHERE tarifa_por_hora > (
    SELECT AVG(tarifa_por_hora) 
    FROM tatuadores 
    WHERE estado = 'activo'
) 
AND estado = 'activo';

-- 3. Tatuadores que han atendido al menos una cita con calificación perfecta (5.00) utilizando IN (Subconsulta)
SELECT 
    id,
    nombre,
    especialidad,
    tarifa_por_hora
FROM tatuadores
WHERE id IN (
    SELECT DISTINCT tatuador_id 
    FROM citas_tatuajes 
    WHERE calificacion = 5.00
);

-- 4. Nombre del tatuador y número total de citas completadas usando una subconsulta correlacionada en la cláusula SELECT
SELECT 
    t.nombre,
    t.especialidad,
    (
        SELECT COUNT(*) 
        FROM citas_tatuajes c 
        WHERE c.tatuador_id = t.id AND c.estado_cita = 'completada'
    ) AS total_citas_completadas
FROM tatuadores t
WHERE t.estado = 'activo';

-- 5. Citas realizadas con el tatuador de mayor tarifa por hora
SELECT 
    c.id AS cita_id,
    c.cliente,
    c.estilo_diseno,
    c.costo_total,
    c.calificacion
FROM citas_tatuajes c
WHERE c.tatuador_id = (
    SELECT id 
    FROM tatuadores 
    ORDER BY tarifa_por_hora DESC 
    LIMIT 1
);