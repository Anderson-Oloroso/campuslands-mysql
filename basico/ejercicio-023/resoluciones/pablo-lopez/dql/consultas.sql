USE campuslands_mysql;

-- =========================================================
-- CONSULTA 1
-- Consultar los proyectos que actualmente están en revisión
-- antes de realizar una actualización.
-- =========================================================

SELECT
    id_proyecto,
    nombre_proyecto,
    arquitecto,
    estado
FROM proyectos_arquitectura_3d
WHERE estado = 'en_revision'
ORDER BY nombre_proyecto ASC;


-- =========================================================
-- CONSULTA 2
-- Actualizar el estado del proyecto "Casa Moderna"
-- de en_revision a aprobado.
-- =========================================================

UPDATE proyectos_arquitectura_3d
SET estado = 'aprobado'
WHERE nombre_proyecto = 'Casa Moderna';

SELECT
    id_proyecto,
    nombre_proyecto,
    estado
FROM proyectos_arquitectura_3d
WHERE nombre_proyecto = 'Casa Moderna';


-- =========================================================
-- CONSULTA 3
-- Incrementar en un 10% el presupuesto de los proyectos
-- que se encuentran en revision.
-- =========================================================

UPDATE proyectos_arquitectura_3d
SET presupuesto = presupuesto * 1.10
WHERE estado = 'en_revision';

SELECT
    id_proyecto,
    nombre_proyecto,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
WHERE estado = 'en_revision'
ORDER BY presupuesto DESC;


-- =========================================================
-- CONSULTA 4
-- Cambiar a aprobado los proyectos de tipo Comercial
-- que actualmente estan en revision.
-- =========================================================

UPDATE proyectos_arquitectura_3d
SET estado = 'aprobado'
WHERE tipo_proyecto = 'Comercial'
  AND estado = 'en_revision';

SELECT
    id_proyecto,
    nombre_proyecto,
    tipo_proyecto,
    estado
FROM proyectos_arquitectura_3d
WHERE tipo_proyecto = 'Comercial';


-- =========================================================
-- CONSULTA 5
-- Actualizar el software del proyecto "Parque Tecnologico"
-- a Revit.
-- =========================================================

UPDATE proyectos_arquitectura_3d
SET software = 'Revit'
WHERE nombre_proyecto = 'Parque Tecnologico';

SELECT
    id_proyecto,
    nombre_proyecto,
    software
FROM proyectos_arquitectura_3d
WHERE nombre_proyecto = 'Parque Tecnologico';


-- =========================================================
-- CONSULTA 6
-- Actualizar el estado de los proyectos en borrador
-- cuyo presupuesto sea superior a Q1,000,000.
-- =========================================================

UPDATE proyectos_arquitectura_3d
SET estado = 'en_revision'
WHERE estado = 'borrador'
  AND presupuesto > 1000000;

SELECT
    id_proyecto,
    nombre_proyecto,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
WHERE presupuesto > 1000000
ORDER BY presupuesto DESC;


-- =========================================================
-- CONSULTA 7
-- Mostrar el estado final de todos los proyectos
-- ordenados por presupuesto de mayor a menor.
-- =========================================================

SELECT
    id_proyecto,
    nombre_proyecto,
    arquitecto,
    tipo_proyecto,
    presupuesto,
    estado
FROM proyectos_arquitectura_3d
ORDER BY presupuesto DESC;