USE campuslands_mysql;

-- 1. Listado de asignaciones con nombre de proyecto y animador (via JOIN)
SELECT p.nombre AS proyecto, a.nombre AS animador, asg.rol_en_proyecto, asg.horas_asignadas
FROM asignaciones_intermedio asg
INNER JOIN proyectos_3d_intermedio p ON p.id_proyecto = asg.id_proyecto
INNER JOIN animadores_intermedio a ON a.id_animador = asg.id_animador
ORDER BY p.nombre, a.nombre;

-- 2. Horas totales trabajadas por cada animador, en todos sus proyectos
SELECT a.nombre AS animador, SUM(asg.horas_asignadas) AS horas_totales
FROM asignaciones_intermedio asg
INNER JOIN animadores_intermedio a ON a.id_animador = asg.id_animador
GROUP BY a.nombre
ORDER BY horas_totales DESC;

-- 3. Animadores asignados a un proyecto especifico
SELECT a.nombre AS animador, a.especialidad, asg.rol_en_proyecto
FROM asignaciones_intermedio asg
INNER JOIN animadores_intermedio a ON a.id_animador = asg.id_animador
INNER JOIN proyectos_3d_intermedio p ON p.id_proyecto = asg.id_proyecto
WHERE p.nombre = 'Serie Animada Piloto';

-- 4. Proyectos con mas de 150 horas totales asignadas (GROUP BY + HAVING)
SELECT p.nombre AS proyecto, SUM(asg.horas_asignadas) AS horas_totales
FROM asignaciones_intermedio asg
INNER JOIN proyectos_3d_intermedio p ON p.id_proyecto = asg.id_proyecto
GROUP BY p.nombre
HAVING SUM(asg.horas_asignadas) > 150
ORDER BY horas_totales DESC;

-- 5. Roles que ha tenido un mismo animador en distintos proyectos
-- (evidencia de que rol y horas dependen de la llave completa, no solo del animador)
SELECT p.nombre AS proyecto, asg.rol_en_proyecto, asg.horas_asignadas
FROM asignaciones_intermedio asg
INNER JOIN animadores_intermedio a ON a.id_animador = asg.id_animador
INNER JOIN proyectos_3d_intermedio p ON p.id_proyecto = asg.id_proyecto
WHERE a.nombre = 'Sofia Herrera';

-- 6. Asignacion individual con mas horas registradas
SELECT p.nombre AS proyecto, a.nombre AS animador, asg.rol_en_proyecto, asg.horas_asignadas
FROM asignaciones_intermedio asg
INNER JOIN proyectos_3d_intermedio p ON p.id_proyecto = asg.id_proyecto
INNER JOIN animadores_intermedio a ON a.id_animador = asg.id_animador
ORDER BY asg.horas_asignadas DESC
LIMIT 1;
