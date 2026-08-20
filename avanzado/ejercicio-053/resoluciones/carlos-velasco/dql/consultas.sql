USE campuslands_mysql;

-- 1. Listar los proyectos con su arquitecto responsable.
SELECT
    p.id_proyecto,
    p.nombre_proyecto,
    p.tipo_proyecto,
    p.ciudad,
    a.nombre AS arquitecto_responsable,
    p.estado
FROM proyectos_arquitectura_3d AS p
INNER JOIN arquitectos_3d AS a
    ON p.id_arquitecto = a.id_arquitecto
ORDER BY p.nombre_proyecto;


-- 2. Consultar proyectos en progreso con presupuesto superior a 600000.
SELECT
    p.nombre_proyecto,
    p.ciudad,
    p.presupuesto,
    p.estado
FROM proyectos_arquitectura_3d AS p
WHERE p.estado = 'en_progreso'
  AND p.presupuesto > 600000
ORDER BY p.presupuesto DESC;


-- 3. Calcular cantidad y presupuesto promedio de proyectos por estado.
SELECT
    estado,
    COUNT(*) AS total_proyectos,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_arquitectura_3d
GROUP BY estado
ORDER BY total_proyectos DESC;


-- 4. Mostrar arquitectos activos y cantidad de proyectos asignados.
SELECT
    a.nombre AS arquitecto,
    a.especialidad,
    COUNT(p.id_proyecto) AS proyectos_asignados
FROM arquitectos_3d AS a
LEFT JOIN proyectos_arquitectura_3d AS p
    ON a.id_arquitecto = p.id_arquitecto
WHERE a.estado = 'activo'
GROUP BY
    a.id_arquitecto,
    a.nombre,
    a.especialidad
ORDER BY proyectos_asignados DESC;


-- 5. Obtener los cinco proyectos con mayor presupuesto.
SELECT
    p.nombre_proyecto,
    p.tipo_proyecto,
    p.ciudad,
    p.presupuesto
FROM proyectos_arquitectura_3d AS p
ORDER BY p.presupuesto DESC
LIMIT 5;


-- 6. Mostrar el presupuesto total administrado por cada arquitecto.
SELECT
    a.nombre AS arquitecto,
    COUNT(p.id_proyecto) AS total_proyectos,
    COALESCE(SUM(p.presupuesto), 0) AS presupuesto_total
FROM arquitectos_3d AS a
LEFT JOIN proyectos_arquitectura_3d AS p
    ON a.id_arquitecto = p.id_arquitecto
GROUP BY
    a.id_arquitecto,
    a.nombre
ORDER BY presupuesto_total DESC;


-- 7. Comprobar los privilegios asignados al rol de lectura.
SHOW GRANTS FOR 'rol_arquitectura_lectura';


-- 8. Comprobar los privilegios asignados al rol de edición.
SHOW GRANTS FOR 'rol_arquitectura_editor';


-- 9. Comprobar los privilegios asignados al rol administrador.
SHOW GRANTS FOR 'rol_arquitectura_admin';