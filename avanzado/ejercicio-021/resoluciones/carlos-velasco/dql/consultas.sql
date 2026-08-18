-- ============================================================
-- Ejercicio 021 - Consultas y EXPLAIN
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Obras publicadas ordenadas por fecha.
-- ------------------------------------------------------------
SELECT
    o.id_obra,
    o.titulo,
    a.nombre AS artista,
    o.tecnica,
    o.fecha_creacion,
    o.precio
FROM obras AS o
INNER JOIN artistas AS a
    ON a.id_artista = o.id_artista
WHERE o.estado = 'publicada'
ORDER BY o.fecha_creacion DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Obras de un artista específico ordenadas por fecha.
-- ------------------------------------------------------------
SELECT
    o.id_obra,
    o.titulo,
    o.tecnica,
    o.fecha_creacion,
    o.precio,
    o.estado
FROM obras AS o
WHERE o.id_artista = 1
ORDER BY o.fecha_creacion ASC;


-- ------------------------------------------------------------
-- Consulta 3
-- Obras con precio superior al promedio.
-- ------------------------------------------------------------
SELECT
    o.id_obra,
    o.titulo,
    a.nombre AS artista,
    o.precio,
    o.estado
FROM obras AS o
INNER JOIN artistas AS a
    ON a.id_artista = o.id_artista
WHERE o.precio > (
    SELECT AVG(precio)
    FROM obras
)
ORDER BY o.precio DESC;


-- ------------------------------------------------------------
-- Consulta 4
-- Cantidad e ingreso promedio por técnica.
-- ------------------------------------------------------------
SELECT
    tecnica,
    COUNT(*) AS total_obras,
    AVG(precio) AS precio_promedio,
    MAX(precio) AS precio_maximo
FROM obras
WHERE estado <> 'archivada'
GROUP BY tecnica
ORDER BY precio_promedio DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Artistas activos con sus obras publicadas.
-- ------------------------------------------------------------
SELECT
    a.nombre AS artista,
    a.especialidad,
    COUNT(o.id_obra) AS obras_publicadas
FROM artistas AS a
INNER JOIN obras AS o
    ON o.id_artista = a.id_artista
WHERE a.estado = 'activo'
  AND o.estado = 'publicada'
GROUP BY
    a.id_artista,
    a.nombre,
    a.especialidad
ORDER BY obras_publicadas DESC, artista ASC;


-- ------------------------------------------------------------
-- Consulta 6
-- Proyectos actualmente en progreso.
-- ------------------------------------------------------------
SELECT
    p.id_proyecto,
    p.nombre AS proyecto,
    a.nombre AS artista,
    p.tipo,
    p.presupuesto,
    p.estado
FROM proyectos AS p
INNER JOIN artistas AS a
    ON a.id_artista = p.id_artista
WHERE p.estado = 'en_progreso'
ORDER BY p.presupuesto DESC;


-- ------------------------------------------------------------
-- Consulta 7
-- Ranking de artistas según el valor de sus obras vendidas.
-- ------------------------------------------------------------
SELECT
    a.nombre AS artista,
    COUNT(o.id_obra) AS obras_vendidas,
    SUM(o.precio) AS valor_total_ventas,
    RANK() OVER (
        ORDER BY SUM(o.precio) DESC
    ) AS posicion
FROM artistas AS a
INNER JOIN obras AS o
    ON o.id_artista = a.id_artista
WHERE o.estado = 'vendida'
GROUP BY
    a.id_artista,
    a.nombre
ORDER BY posicion;


-- ------------------------------------------------------------
-- Consulta 8
-- Presupuesto total de proyectos por estado.
-- ------------------------------------------------------------
SELECT
    estado,
    COUNT(*) AS total_proyectos,
    SUM(presupuesto) AS presupuesto_total,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos
GROUP BY estado
ORDER BY presupuesto_total DESC;


-- ============================================================
-- ANALISIS CON EXPLAIN
-- ============================================================

-- ------------------------------------------------------------
-- EXPLAIN 1
-- Analiza el filtro por estado de las obras.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_obra,
    titulo,
    tecnica,
    precio
FROM obras
WHERE estado = 'publicada';


-- ------------------------------------------------------------
-- EXPLAIN 2
-- Analiza la búsqueda de obras por artista y fecha.
-- Debe considerar idx_obras_artista_fecha.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_obra,
    titulo,
    tecnica,
    fecha_creacion,
    precio
FROM obras
WHERE id_artista = 1
ORDER BY fecha_creacion ASC;


-- ------------------------------------------------------------
-- EXPLAIN 3
-- Analiza la búsqueda por precio.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_obra,
    titulo,
    precio
FROM obras
WHERE precio > 600
ORDER BY precio DESC;


-- ------------------------------------------------------------
-- EXPLAIN 4
-- Analiza proyectos filtrados por artista y estado.
-- Debe considerar idx_proyectos_artista_estado.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_proyecto,
    nombre,
    tipo,
    presupuesto,
    estado
FROM proyectos
WHERE id_artista = 1
  AND estado = 'en_progreso';


-- ------------------------------------------------------------
-- EXPLAIN 5
-- Analiza proyectos por estado.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_proyecto,
    nombre,
    presupuesto
FROM proyectos
WHERE estado = 'en_progreso'
ORDER BY presupuesto DESC;


-- ============================================================
-- COMPROBACION DE INDICES
-- ============================================================

SHOW INDEX FROM obras;

SHOW INDEX FROM proyectos;

SHOW INDEX FROM artistas;