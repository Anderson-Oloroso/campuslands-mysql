-- ============================================================
-- Ejercicio 022 - Consultas sobre vistas avanzadas
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Resumen general de todos los proyectos.
-- Utiliza la vista vw_resumen_proyectos_3d.
-- ------------------------------------------------------------
SELECT
    proyecto,
    tipo,
    estado,
    presupuesto,
    total_escenas,
    horas_totales,
    horas_promedio_escena,
    artistas_participantes
FROM vw_resumen_proyectos_3d
ORDER BY horas_totales DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Proyectos actualmente en progreso.
-- ------------------------------------------------------------
SELECT
    proyecto,
    tipo,
    presupuesto,
    total_escenas,
    horas_totales,
    artistas_participantes
FROM vw_resumen_proyectos_3d
WHERE estado = 'en_progreso'
ORDER BY presupuesto DESC;


-- ------------------------------------------------------------
-- Consulta 3
-- Proyectos con mayor carga de trabajo.
-- ------------------------------------------------------------
SELECT
    proyecto,
    total_escenas,
    horas_totales,
    horas_promedio_escena
FROM vw_resumen_proyectos_3d
WHERE total_escenas > 0
ORDER BY horas_totales DESC
LIMIT 5;


-- ------------------------------------------------------------
-- Consulta 4
-- Rendimiento general de los artistas.
-- Utiliza la vista vw_rendimiento_artistas_3d.
-- ------------------------------------------------------------
SELECT
    artista,
    especialidad,
    experiencia_anios,
    escenas_asignadas,
    escenas_finalizadas,
    horas_trabajadas,
    horas_promedio_escena
FROM vw_rendimiento_artistas_3d
ORDER BY horas_trabajadas DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Artistas con al menos una escena finalizada.
-- ------------------------------------------------------------
SELECT
    artista,
    especialidad,
    escenas_asignadas,
    escenas_finalizadas,
    horas_trabajadas
FROM vw_rendimiento_artistas_3d
WHERE escenas_finalizadas > 0
ORDER BY escenas_finalizadas DESC, horas_trabajadas DESC;


-- ------------------------------------------------------------
-- Consulta 6
-- Escenas críticas pendientes o en progreso.
-- Utiliza la vista vw_escenas_criticas_3d.
-- ------------------------------------------------------------
SELECT
    escena,
    proyecto,
    artista,
    especialidad,
    horas_trabajadas,
    complejidad,
    estado
FROM vw_escenas_criticas_3d
ORDER BY horas_trabajadas DESC;


-- ------------------------------------------------------------
-- Consulta 7
-- Ranking de artistas según horas trabajadas.
-- ------------------------------------------------------------
SELECT
    artista,
    especialidad,
    horas_trabajadas,
    escenas_asignadas,
    RANK() OVER (
        ORDER BY horas_trabajadas DESC
    ) AS posicion
FROM vw_rendimiento_artistas_3d
WHERE escenas_asignadas > 0
ORDER BY posicion;


-- ------------------------------------------------------------
-- Consulta 8
-- Comparación del presupuesto con las horas de trabajo
-- de cada proyecto.
-- ------------------------------------------------------------
SELECT
    proyecto,
    presupuesto,
    horas_totales,
    CASE
        WHEN horas_totales = 0 THEN 0
        ELSE ROUND(presupuesto / horas_totales, 2)
    END AS presupuesto_por_hora
FROM vw_resumen_proyectos_3d
ORDER BY presupuesto_por_hora DESC;


-- ============================================================
-- CONSULTAS DIRECTAS SOBRE LAS TABLAS
-- ============================================================

-- ------------------------------------------------------------
-- Consulta adicional:
-- cantidad de escenas por nivel de complejidad.
-- ------------------------------------------------------------
SELECT
    complejidad,
    COUNT(*) AS total_escenas,
    SUM(horas_trabajadas) AS horas_totales
FROM escenas
GROUP BY complejidad
ORDER BY horas_totales DESC;


-- ------------------------------------------------------------
-- Consulta adicional:
-- proyectos sin escenas asignadas.
-- ------------------------------------------------------------
SELECT
    p.id_proyecto,
    p.nombre AS proyecto,
    p.tipo,
    p.estado
FROM proyectos_3d AS p
LEFT JOIN escenas AS s
    ON s.id_proyecto = p.id_proyecto
WHERE s.id_escena IS NULL
ORDER BY p.nombre;