USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Videojuegos disponibles ordenados por puntuacion.
-- Utiliza el indice:
-- idx_videojuegos_estado_puntuacion
-- ============================================================

SELECT
    titulo,
    genero,
    plataforma,
    precio,
    puntuacion
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY puntuacion DESC;


-- ============================================================
-- CONSULTA 2
-- Videojuegos disponibles de un genero especifico.
-- Utiliza el indice:
-- idx_videojuegos_genero_estado
-- ============================================================

SELECT
    titulo,
    plataforma,
    precio,
    puntuacion
FROM videojuegos
WHERE genero = 'RPG'
  AND estado = 'disponible'
ORDER BY puntuacion DESC;


-- ============================================================
-- CONSULTA 3
-- Videojuegos disponibles por plataforma.
-- Utiliza el indice:
-- idx_videojuegos_plataforma_estado
-- ============================================================

SELECT
    titulo,
    genero,
    precio,
    puntuacion
FROM videojuegos
WHERE plataforma = 'PC'
  AND estado = 'disponible'
ORDER BY precio ASC;


-- ============================================================
-- CONSULTA 4
-- Promedio de puntuacion y precio por genero.
-- ============================================================

SELECT
    genero,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(puntuacion), 2) AS puntuacion_promedio,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM videojuegos
WHERE estado = 'disponible'
GROUP BY genero
ORDER BY puntuacion_promedio DESC;


-- ============================================================
-- CONSULTA 5
-- Videojuegos con puntuacion alta y precio accesible.
-- ============================================================

SELECT
    titulo,
    genero,
    plataforma,
    precio,
    puntuacion
FROM videojuegos
WHERE estado = 'disponible'
  AND puntuacion >= 8.5
  AND precio <= 60.00
ORDER BY puntuacion DESC, precio ASC;


-- ============================================================
-- CONSULTA 6
-- Analisis del plan de ejecucion para el filtro por estado
-- y ordenamiento por puntuacion.
--
-- Permite comprobar si MySQL considera el indice:
-- idx_videojuegos_estado_puntuacion
-- ============================================================

EXPLAIN
SELECT
    titulo,
    genero,
    plataforma,
    precio,
    puntuacion
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY puntuacion DESC;


-- ============================================================
-- CONSULTA 7
-- Analisis del plan de ejecucion para el filtro combinado
-- de genero y estado.
--
-- Permite comprobar el uso de:
-- idx_videojuegos_genero_estado
-- ============================================================

EXPLAIN
SELECT
    titulo,
    plataforma,
    precio,
    puntuacion
FROM videojuegos
WHERE genero = 'RPG'
  AND estado = 'disponible'
ORDER BY puntuacion DESC;