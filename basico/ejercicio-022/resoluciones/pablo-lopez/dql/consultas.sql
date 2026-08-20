USE campuslands_mysql;

-- =========================================================
-- CONSULTA 1
-- Mostrar todas las animaciones ordenadas por título
-- alfabéticamente.
-- =========================================================

SELECT
    id_animacion,
    titulo,
    animador,
    categoria,
    software,
    estado
FROM animaciones_3d
ORDER BY titulo ASC;


-- =========================================================
-- CONSULTA 2
-- Mostrar las animaciones desde la más costosa
-- hasta la menos costosa.
-- =========================================================

SELECT
    id_animacion,
    titulo,
    animador,
    costo
FROM animaciones_3d
ORDER BY costo DESC;


-- =========================================================
-- CONSULTA 3
-- Mostrar las animaciones desde la de mayor duración
-- hasta la de menor duración.
-- =========================================================

SELECT
    id_animacion,
    titulo,
    duracion_segundos,
    estado
FROM animaciones_3d
ORDER BY duracion_segundos DESC;


-- =========================================================
-- CONSULTA 4
-- Mostrar las animaciones finalizadas ordenadas
-- por fecha de producción, desde la más reciente.
-- =========================================================

SELECT
    id_animacion,
    titulo,
    animador,
    fecha_produccion,
    estado
FROM animaciones_3d
WHERE estado = 'finalizada'
ORDER BY fecha_produccion DESC;


-- =========================================================
-- CONSULTA 5
-- Mostrar las animaciones ordenadas primero por categoría
-- y después por costo de mayor a menor.
-- =========================================================

SELECT
    id_animacion,
    titulo,
    categoria,
    costo
FROM animaciones_3d
ORDER BY categoria ASC, costo DESC;


-- =========================================================
-- CONSULTA 6
-- Mostrar las 5 animaciones con mayor costo.
-- =========================================================

SELECT
    id_animacion,
    titulo,
    animador,
    costo
FROM animaciones_3d
ORDER BY costo DESC
LIMIT 5;


-- =========================================================
-- CONSULTA 7
-- Mostrar las animaciones con duración superior a 100
-- segundos, ordenadas de menor a mayor duración.
-- =========================================================

SELECT
    id_animacion,
    titulo,
    duracion_segundos,
    costo
FROM animaciones_3d
WHERE duracion_segundos > 100
ORDER BY duracion_segundos ASC;