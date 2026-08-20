LOCK TABLES equipos_soldar WRITE, proyectos_soldadura WRITE;

UPDATE equipos_soldar
SET estado_equipo = 'En Uso'
WHERE equipo_id = 1;

UPDATE proyectos_soldadura
SET estado_proyecto = 'En Progreso'
WHERE proyecto_id = 1;

UNLOCK TABLES;

START TRANSACTION;

SELECT 
    proyecto_id,
    nombre_proyecto,
    estado_proyecto
FROM proyectos_soldadura
WHERE proyecto_id = 1
FOR UPDATE;

UPDATE proyectos_soldadura
SET estado_proyecto = 'En Inspección'
WHERE proyecto_id = 1;

COMMIT;

START TRANSACTION;

SELECT 
    e.equipo_id,
    e.codigo_inventario,
    e.estado_equipo,
    p.nombre_proyecto
FROM equipos_soldar e
INNER JOIN proyectos_soldadura p ON e.equipo_id = p.equipo_id
WHERE e.equipo_id = 1
FOR SHARE;

COMMIT;


SELECT 
    p.proyecto_id,
    p.nombre_proyecto,
    s.nombre_soldador,
    s.certificacion_codigo,
    e.codigo_inventario AS equipo_codigo,
    e.tipo_proceso,
    e.estado_equipo,
    p.estado_proyecto
FROM proyectos_soldadura p
INNER JOIN soldadores s ON p.soldador_id = s.soldador_id
INNER JOIN equipos_soldar e ON p.equipo_id = e.equipo_id
ORDER BY p.proyecto_id ASC;

SELECT 
    i.inspeccion_id,
    p.nombre_proyecto,
    i.tipo_ensayo,
    i.inspector_responsable,
    i.resultado,
    i.fecha_inspeccion
FROM inspecciones_soldadura i
INNER JOIN proyectos_soldadura p ON i.proyecto_id = p.proyecto_id
ORDER BY i.inspeccion_id ASC;