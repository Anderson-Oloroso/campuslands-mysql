USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Listado general de platos disponibles.
-- ============================================================

SELECT
    id_plato,
    nombre,
    categoria,
    precio
FROM platos
WHERE disponible = TRUE
  AND estado = 'activo'
ORDER BY nombre;


-- ============================================================
-- CONSULTA 2
-- Platos ordenados de menor a mayor precio.
-- ============================================================

SELECT
    nombre,
    categoria,
    precio
FROM platos
WHERE estado = 'activo'
ORDER BY precio ASC;


-- ============================================================
-- CONSULTA 3
-- Platos con precio superior a 25.
-- ============================================================

SELECT
    nombre,
    categoria,
    precio
FROM platos
WHERE precio > 25.00
  AND estado = 'activo'
ORDER BY precio DESC;


-- ============================================================
-- CONSULTA 4
-- Cantidad de platos por categoria.
-- ============================================================

SELECT
    categoria,
    COUNT(*) AS total_platos
FROM platos
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY total_platos DESC, categoria;


-- ============================================================
-- CONSULTA 5
-- Precio promedio de los platos activos.
-- ============================================================

SELECT
    ROUND(AVG(precio), 2) AS precio_promedio
FROM platos
WHERE estado = 'activo';


-- ============================================================
-- CONSULTA 6
-- Plato disponible mas costoso.
-- ============================================================

SELECT
    nombre,
    categoria,
    precio
FROM platos
WHERE disponible = TRUE
  AND estado = 'activo'
ORDER BY precio DESC
LIMIT 1;