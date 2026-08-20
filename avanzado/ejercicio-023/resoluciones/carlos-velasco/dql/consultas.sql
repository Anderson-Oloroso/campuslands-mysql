-- ============================================================
-- Ejercicio 023 - Consultas y comprobación de permisos
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Proyectos actualmente en progreso.
-- ------------------------------------------------------------
SELECT
    p.id_proyecto,
    p.nombre AS proyecto,
    a.nombre AS arquitecto,
    p.tipo,
    p.presupuesto,
    p.estado
FROM proyectos_arquitectura AS p
INNER JOIN arquitectos AS a
    ON a.id_arquitecto = p.id_arquitecto
WHERE p.estado = 'en_progreso'
ORDER BY p.presupuesto DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Proyectos ordenados por presupuesto.
-- ------------------------------------------------------------
SELECT
    p.nombre AS proyecto,
    p.tipo,
    a.nombre AS arquitecto,
    p.presupuesto,
    p.estado
FROM proyectos_arquitectura AS p
INNER JOIN arquitectos AS a
    ON a.id_arquitecto = p.id_arquitecto
ORDER BY p.presupuesto DESC;


-- ------------------------------------------------------------
-- Consulta 3
-- Cantidad de proyectos y presupuesto por tipo.
-- ------------------------------------------------------------
SELECT
    tipo,
    COUNT(*) AS total_proyectos,
    SUM(presupuesto) AS presupuesto_total,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_arquitectura
GROUP BY tipo
ORDER BY presupuesto_total DESC;


-- ------------------------------------------------------------
-- Consulta 4
-- Arquitectos activos y cantidad de proyectos asignados.
-- ------------------------------------------------------------
SELECT
    a.nombre AS arquitecto,
    a.especialidad,
    COUNT(p.id_proyecto) AS proyectos_asignados
FROM arquitectos AS a
LEFT JOIN proyectos_arquitectura AS p
    ON p.id_arquitecto = a.id_arquitecto
WHERE a.estado = 'activo'
GROUP BY
    a.id_arquitecto,
    a.nombre,
    a.especialidad
ORDER BY proyectos_asignados DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Modelos 3D de alto nivel de detalle.
-- ------------------------------------------------------------
SELECT
    m.nombre AS modelo,
    p.nombre AS proyecto,
    m.categoria,
    m.horas_modelado,
    m.estado
FROM modelos_3d AS m
INNER JOIN proyectos_arquitectura AS p
    ON p.id_proyecto = m.id_proyecto
WHERE m.nivel_detalle = 'alto'
ORDER BY m.horas_modelado DESC;


-- ------------------------------------------------------------
-- Consulta 6
-- Horas de modelado por proyecto.
-- ------------------------------------------------------------
SELECT
    p.nombre AS proyecto,
    COUNT(m.id_modelo) AS total_modelos,
    SUM(m.horas_modelado) AS horas_totales,
    AVG(m.horas_modelado) AS horas_promedio
FROM proyectos_arquitectura AS p
INNER JOIN modelos_3d AS m
    ON m.id_proyecto = p.id_proyecto
GROUP BY
    p.id_proyecto,
    p.nombre
ORDER BY horas_totales DESC;


-- ------------------------------------------------------------
-- Consulta 7
-- Ranking de proyectos por presupuesto.
-- ------------------------------------------------------------
SELECT
    nombre AS proyecto,
    tipo,
    presupuesto,
    RANK() OVER (
        ORDER BY presupuesto DESC
    ) AS posicion
FROM proyectos_arquitectura
ORDER BY posicion;


-- ------------------------------------------------------------
-- Consulta 8
-- Modelos que requieren revisión.
-- ------------------------------------------------------------
SELECT
    m.nombre AS modelo,
    p.nombre AS proyecto,
    m.nivel_detalle,
    m.horas_modelado,
    m.estado
FROM modelos_3d AS m
INNER JOIN proyectos_arquitectura AS p
    ON p.id_proyecto = m.id_proyecto
WHERE m.estado = 'revision'
ORDER BY m.horas_modelado DESC;


-- ============================================================
-- COMPROBACIÓN DE ROLES Y PERMISOS
-- ============================================================


-- ------------------------------------------------------------
-- Consulta 9
-- Ver los roles existentes.
-- ------------------------------------------------------------
SELECT
    User,
    Host
FROM mysql.user
WHERE account_locked = 'N'
  AND User LIKE 'rol_%';


-- ------------------------------------------------------------
-- Consulta 10
-- Permisos asignados al rol de arquitecto.
-- ------------------------------------------------------------
SHOW GRANTS FOR 'rol_arquitecto';


-- ------------------------------------------------------------
-- Consulta 11
-- Permisos asignados al rol de consulta.
-- ------------------------------------------------------------
SHOW GRANTS FOR 'rol_consulta_3d';


-- ------------------------------------------------------------
-- Consulta 12
-- Comprobar las tablas disponibles en la base de datos.
-- ------------------------------------------------------------
SHOW TABLES;