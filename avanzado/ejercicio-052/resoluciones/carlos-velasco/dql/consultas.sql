USE campuslands_mysql;


-- 1. Consultar el detalle completo de participaciones.
SELECT
    proyecto,
    estudio,
    animador,
    especialidad,
    rol,
    horas_trabajadas
FROM vw_participaciones_animacion
ORDER BY proyecto, animador;


-- 2. Consultar únicamente los proyectos actualmente en producción.
SELECT
    proyecto,
    estudio,
    presupuesto,
    total_animadores,
    horas_totales
FROM vw_resumen_proyectos
WHERE estado = 'produccion'
ORDER BY horas_totales DESC;


-- 3. Obtener los proyectos con más de 200 horas de trabajo.
SELECT
    proyecto,
    total_animadores,
    horas_totales,
    experiencia_promedio
FROM vw_resumen_proyectos
WHERE horas_totales > 200
ORDER BY horas_totales DESC;


-- 4. Obtener los cinco proyectos con mayor presupuesto.
SELECT
    proyecto,
    estudio,
    presupuesto,
    estado
FROM vw_resumen_proyectos
ORDER BY presupuesto DESC
LIMIT 5;


-- 5. Obtener el promedio de horas trabajadas por especialidad.
SELECT
    especialidad,
    COUNT(*) AS participaciones,
    AVG(horas_trabajadas) AS promedio_horas
FROM vw_participaciones_animacion
GROUP BY especialidad
ORDER BY promedio_horas DESC;


-- 6. Obtener animadores con más de un proyecto asignado.
SELECT
    animador,
    especialidad,
    COUNT(DISTINCT id_proyecto) AS proyectos_asignados,
    SUM(horas_trabajadas) AS horas_totales
FROM vw_participaciones_animacion
GROUP BY
    id_animador,
    animador,
    especialidad
HAVING COUNT(DISTINCT id_proyecto) > 1
ORDER BY proyectos_asignados DESC, horas_totales DESC;


-- 7. Obtener el proyecto con mayor carga de trabajo.
SELECT
    proyecto,
    total_animadores,
    horas_totales,
    experiencia_promedio
FROM vw_resumen_proyectos
ORDER BY horas_totales DESC
LIMIT 1;