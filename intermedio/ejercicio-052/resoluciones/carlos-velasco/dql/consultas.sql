-- ============================================================
-- EJERCICIO 052 - NORMALIZACION 2FN PARA ANIMACION 3D
-- DQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- CONSULTA 1
-- Animadores asignados a cada proyecto.
-- ============================================================

SELECT
    p.nombre AS proyecto,
    a.nombre AS animador,
    pa.rol,
    pa.horas_asignadas
FROM proyecto_animador pa
INNER JOIN proyectos_animacion p
    ON pa.proyecto_id = p.proyecto_id
INNER JOIN animadores a
    ON pa.animador_id = a.animador_id
ORDER BY
    p.nombre,
    a.nombre;


-- ============================================================
-- CONSULTA 2
-- Cantidad de animadores asignados a cada proyecto.
-- ============================================================

SELECT
    p.nombre AS proyecto,
    COUNT(pa.animador_id) AS total_animadores
FROM proyectos_animacion p
INNER JOIN proyecto_animador pa
    ON p.proyecto_id = pa.proyecto_id
GROUP BY
    p.proyecto_id,
    p.nombre
ORDER BY
    total_animadores DESC,
    proyecto;


-- ============================================================
-- CONSULTA 3
-- Horas totales asignadas a cada proyecto.
-- ============================================================

SELECT
    p.nombre AS proyecto,
    SUM(pa.horas_asignadas) AS horas_totales
FROM proyectos_animacion p
INNER JOIN proyecto_animador pa
    ON p.proyecto_id = pa.proyecto_id
GROUP BY
    p.proyecto_id,
    p.nombre
ORDER BY
    horas_totales DESC;


-- ============================================================
-- CONSULTA 4
-- Animadores que participan en mas de un proyecto.
-- ============================================================

SELECT
    a.nombre AS animador,
    a.especialidad,
    COUNT(pa.proyecto_id) AS proyectos_asignados
FROM animadores a
INNER JOIN proyecto_animador pa
    ON a.animador_id = pa.animador_id
GROUP BY
    a.animador_id,
    a.nombre,
    a.especialidad
HAVING COUNT(pa.proyecto_id) > 1
ORDER BY
    proyectos_asignados DESC,
    animador;


-- ============================================================
-- CONSULTA 5
-- Proyectos en produccion con mas de 200 horas asignadas.
-- ============================================================

SELECT
    p.nombre AS proyecto,
    p.estado,
    SUM(pa.horas_asignadas) AS horas_totales
FROM proyectos_animacion p
INNER JOIN proyecto_animador pa
    ON p.proyecto_id = pa.proyecto_id
WHERE p.estado = 'en_produccion'
GROUP BY
    p.proyecto_id,
    p.nombre,
    p.estado
HAVING SUM(pa.horas_asignadas) > 200
ORDER BY
    horas_totales DESC;


-- ============================================================
-- CONSULTA 6
-- Resumen de carga de trabajo por especialidad.
-- ============================================================

SELECT
    a.especialidad,
    COUNT(DISTINCT a.animador_id) AS total_animadores,
    SUM(pa.horas_asignadas) AS horas_asignadas,
    ROUND(AVG(pa.horas_asignadas), 2) AS promedio_horas
FROM animadores a
INNER JOIN proyecto_animador pa
    ON a.animador_id = pa.animador_id
GROUP BY
    a.especialidad
ORDER BY
    horas_asignadas DESC;


-- ============================================================
-- CONSULTA 7
-- Animadores activos con sus proyectos y horas acumuladas.
-- ============================================================

SELECT
    a.nombre AS animador,
    a.nivel,
    COUNT(pa.proyecto_id) AS total_proyectos,
    SUM(pa.horas_asignadas) AS horas_totales
FROM animadores a
INNER JOIN proyecto_animador pa
    ON a.animador_id = pa.animador_id
WHERE a.estado = 'activo'
GROUP BY
    a.animador_id,
    a.nombre,
    a.nivel
ORDER BY
    horas_totales DESC;