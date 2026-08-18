USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Mostrar todos los trabajos registrados.
-- ============================================================

SELECT
    id_trabajo,
    nombre_trabajo,
    tipo_soldadura,
    material,
    costo,
    estado,
    fecha_trabajo
FROM trabajos_soldadura
ORDER BY id_trabajo;


-- ============================================================
-- CONSULTA 2
-- Mostrar los trabajos cancelados.
-- ============================================================

SELECT
    id_trabajo,
    nombre_trabajo,
    tipo_soldadura,
    costo,
    estado
FROM trabajos_soldadura
WHERE estado = 'cancelado'
ORDER BY costo DESC;


-- ============================================================
-- CONSULTA 3
-- Consultar específicamente el registro que será eliminado.
-- ============================================================

SELECT
    id_trabajo,
    nombre_trabajo,
    tipo_soldadura,
    material,
    costo,
    estado
FROM trabajos_soldadura
WHERE id_trabajo = 7
  AND estado = 'cancelado';


-- ============================================================
-- CONSULTA 4
-- DELETE controlado.
--
-- La condición utiliza la clave primaria y el estado esperado
-- para evitar eliminar accidentalmente otro registro.
-- ============================================================

DELETE FROM trabajos_soldadura
WHERE id_trabajo = 7
  AND estado = 'cancelado';


-- ============================================================
-- CONSULTA 5
-- Verificar que el registro eliminado ya no existe.
-- ============================================================

SELECT
    id_trabajo,
    nombre_trabajo,
    estado
FROM trabajos_soldadura
WHERE id_trabajo = 7;


-- ============================================================
-- CONSULTA 6
-- Mostrar trabajos cuyo costo supera 1000.
-- ============================================================

SELECT
    nombre_trabajo,
    material,
    costo,
    estado
FROM trabajos_soldadura
WHERE costo > 1000
ORDER BY costo DESC;


-- ============================================================
-- CONSULTA 7
-- Cantidad de trabajos y costo promedio por tipo de soldadura.
-- ============================================================

SELECT
    tipo_soldadura,
    COUNT(*) AS total_trabajos,
    ROUND(AVG(costo), 2) AS costo_promedio
FROM trabajos_soldadura
GROUP BY tipo_soldadura
ORDER BY costo_promedio DESC;


-- ============================================================
-- CONSULTA 8
-- Trabajos agrupados por estado.
-- ============================================================

SELECT
    estado,
    COUNT(*) AS total_trabajos,
    ROUND(SUM(costo), 2) AS costo_total
FROM trabajos_soldadura
GROUP BY estado
ORDER BY total_trabajos DESC;