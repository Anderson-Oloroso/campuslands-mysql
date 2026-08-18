USE campuslands_mysql;

-- 1. Proyectos con los animadores asignados.
SELECT
    p.titulo AS proyecto,
    a.nombre AS animador,
    a.especialidad,
    aa.horas_asignadas
FROM proyectos_animacion AS p
INNER JOIN asignaciones_animacion AS aa
    ON p.id_proyecto = aa.id_proyecto
INNER JOIN animadores AS a
    ON aa.id_animador = a.id_animador
ORDER BY p.titulo, a.nombre;


-- 2. Cantidad de animadores asignados y horas totales por proyecto.
SELECT
    p.titulo AS proyecto,
    COUNT(aa.id_animador) AS total_animadores,
    ROUND(SUM(aa.horas_asignadas), 2) AS horas_totales
FROM proyectos_animacion AS p
INNER JOIN asignaciones_animacion AS aa
    ON p.id_proyecto = aa.id_proyecto
GROUP BY p.id_proyecto, p.titulo
ORDER BY horas_totales DESC;


-- 3. Animadores con más horas asignadas.
SELECT
    a.nombre AS animador,
    a.especialidad,
    COUNT(aa.id_proyecto) AS proyectos_asignados,
    ROUND(SUM(aa.horas_asignadas), 2) AS horas_totales
FROM animadores AS a
INNER JOIN asignaciones_animacion AS aa
    ON a.id_animador = aa.id_animador
GROUP BY a.id_animador, a.nombre, a.especialidad
ORDER BY horas_totales DESC;


-- 4. Proyectos activos con presupuesto superior a 5000.
SELECT
    p.titulo AS proyecto,
    p.software,
    p.presupuesto,
    p.fecha_entrega
FROM proyectos_animacion AS p
WHERE p.estado = 'activo'
  AND p.presupuesto > 5000
ORDER BY p.presupuesto DESC;


-- 5. Proyectos que tienen más de un animador asignado.
SELECT
    p.titulo AS proyecto,
    COUNT(aa.id_animador) AS total_animadores
FROM proyectos_animacion AS p
INNER JOIN asignaciones_animacion AS aa
    ON p.id_proyecto = aa.id_proyecto
GROUP BY p.id_proyecto, p.titulo
HAVING COUNT(aa.id_animador) > 1
ORDER BY total_animadores DESC;