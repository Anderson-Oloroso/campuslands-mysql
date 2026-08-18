USE campuslands_mysql;


-- =========================================================
-- VISTA 1
-- Resumen general de cada proyecto.
-- =========================================================

CREATE OR REPLACE VIEW vw_proyectos_animacion AS
SELECT
    p.id,
    p.nombre,
    p.categoria,
    p.presupuesto,
    p.duracion_minutos,
    p.estado,
    p.fecha_inicio,
    CASE
        WHEN p.estado = 'finalizado' THEN 'Completado'
        WHEN p.estado = 'en_produccion' THEN 'En desarrollo'
        ELSE 'Detenido'
    END AS estado_descripcion
FROM proyectos_animacion AS p;


-- =========================================================
-- VISTA 2
-- Proyectos junto con los integrantes de su equipo.
-- =========================================================

CREATE OR REPLACE VIEW vw_proyectos_equipo AS
SELECT
    p.id AS proyecto_id,
    p.nombre AS proyecto,
    p.categoria,
    p.estado,
    a.id AS animador_id,
    a.nombre AS animador,
    a.especialidad,
    pa.rol
FROM proyecto_animador AS pa
INNER JOIN proyectos_animacion AS p
    ON pa.proyecto_id = p.id
INNER JOIN animadores AS a
    ON pa.animador_id = a.id;


-- =========================================================
-- VISTA 3
-- Indicadores agrupados por categoria.
-- =========================================================

CREATE OR REPLACE VIEW vw_resumen_categorias AS
SELECT
    p.categoria,
    COUNT(p.id) AS total_proyectos,
    ROUND(AVG(p.presupuesto), 2) AS presupuesto_promedio,
    ROUND(AVG(p.duracion_minutos), 2) AS duracion_promedio,
    SUM(p.presupuesto) AS presupuesto_total
FROM proyectos_animacion AS p
GROUP BY p.categoria;


-- =========================================================
-- CONSULTA 1
-- Consultar la vista general de proyectos.
-- =========================================================

SELECT
    id,
    nombre,
    categoria,
    presupuesto,
    duracion_minutos,
    estado_descripcion
FROM vw_proyectos_animacion
ORDER BY presupuesto DESC;


-- =========================================================
-- CONSULTA 2
-- Mostrar los equipos de los proyectos en produccion.
-- =========================================================

SELECT
    proyecto,
    categoria,
    animador,
    especialidad,
    rol
FROM vw_proyectos_equipo
WHERE estado = 'en_produccion'
ORDER BY proyecto, animador;


-- =========================================================
-- CONSULTA 3
-- Mostrar categorias con presupuesto promedio superior
-- a 10000.
-- =========================================================

SELECT
    categoria,
    total_proyectos,
    presupuesto_promedio,
    presupuesto_total
FROM vw_resumen_categorias
WHERE presupuesto_promedio > 10000
ORDER BY presupuesto_promedio DESC;


-- =========================================================
-- CONSULTA 4
-- Obtener los proyectos que tienen mas de un animador.
-- =========================================================

SELECT
    proyecto,
    categoria,
    COUNT(animador_id) AS total_animadores
FROM vw_proyectos_equipo
GROUP BY proyecto_id, proyecto, categoria
HAVING COUNT(animador_id) > 1
ORDER BY total_animadores DESC, proyecto;


-- =========================================================
-- CONSULTA 5
-- Mostrar los proyectos de mayor duracion.
-- =========================================================

SELECT
    nombre AS proyecto,
    categoria,
    duracion_minutos,
    estado_descripcion
FROM vw_proyectos_animacion
WHERE duracion_minutos >= 20
ORDER BY duracion_minutos DESC;


-- =========================================================
-- CONSULTA 6
-- Mostrar cuantos proyectos tiene cada especialidad.
-- =========================================================

SELECT
    especialidad,
    COUNT(DISTINCT proyecto_id) AS total_proyectos
FROM vw_proyectos_equipo
GROUP BY especialidad
ORDER BY total_proyectos DESC;


-- =========================================================
-- CONSULTA 7
-- Obtener los 5 proyectos con mayor presupuesto.
-- =========================================================

SELECT
    nombre AS proyecto,
    categoria,
    presupuesto,
    estado_descripcion
FROM vw_proyectos_animacion
ORDER BY presupuesto DESC
LIMIT 5;