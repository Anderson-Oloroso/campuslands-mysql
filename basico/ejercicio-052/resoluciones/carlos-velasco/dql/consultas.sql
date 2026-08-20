USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Proyectos ordenados alfabeticamente por nombre.
-- ============================================================

SELECT
    id_proyecto,
    nombre,
    tipo_animacion,
    estado
FROM proyectos_animacion
ORDER BY nombre ASC;


-- ============================================================
-- CONSULTA 2
-- Proyectos ordenados de mayor a menor presupuesto.
-- ============================================================

SELECT
    nombre,
    tipo_animacion,
    presupuesto,
    estado
FROM proyectos_animacion
ORDER BY presupuesto DESC;


-- ============================================================
-- CONSULTA 3
-- Proyectos ordenados por cantidad de horas de produccion,
-- de menor a mayor.
-- ============================================================

SELECT
    nombre,
    artista_principal,
    horas_produccion
FROM proyectos_animacion
ORDER BY horas_produccion ASC;


-- ============================================================
-- CONSULTA 4
-- Proyectos ordenados por fecha de entrega mas proxima.
-- ============================================================

SELECT
    nombre,
    fecha_entrega,
    estado
FROM proyectos_animacion
ORDER BY fecha_entrega ASC;


-- ============================================================
-- CONSULTA 5
-- Proyectos actualmente en produccion, ordenados por
-- presupuesto de mayor a menor.
-- ============================================================

SELECT
    nombre,
    tipo_animacion,
    presupuesto,
    horas_produccion
FROM proyectos_animacion
WHERE estado = 'en_produccion'
ORDER BY presupuesto DESC;


-- ============================================================
-- CONSULTA 6
-- Ordenamiento multiple:
-- primero por estado y luego por fecha de entrega.
-- ============================================================

SELECT
    nombre,
    estado,
    fecha_entrega,
    presupuesto
FROM proyectos_animacion
ORDER BY
    estado ASC,
    fecha_entrega ASC;


-- ============================================================
-- CONSULTA 7
-- Top 5 de proyectos con mayor presupuesto.
-- ============================================================

SELECT
    nombre,
    tipo_animacion,
    presupuesto,
    estado
FROM proyectos_animacion
ORDER BY presupuesto DESC
LIMIT 5;