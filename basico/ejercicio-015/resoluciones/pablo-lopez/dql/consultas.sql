-- ============================================================
-- Ejercicio 015 - Relaciones simples para biblioteca gamer
-- Archivo: dql/consultas.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- CONSULTA 1
-- Listar todos los juegos activos ordenados por puntaje.
-- ============================================================

SELECT
    id_juego,
    titulo,
    plataforma,
    puntaje,
    precio
FROM juegos
WHERE estado = 'activo'
ORDER BY puntaje DESC;


-- ============================================================
-- CONSULTA 2
-- Mostrar los juegos junto con el nombre de su categoría.
-- Demuestra la relación entre las tablas.
-- ============================================================

SELECT
    j.titulo AS juego,
    j.plataforma,
    c.nombre AS categoria,
    j.puntaje,
    j.estado
FROM juegos AS j
INNER JOIN categorias AS c
    ON j.id_categoria = c.id_categoria
ORDER BY c.nombre ASC, j.titulo ASC;


-- ============================================================
-- CONSULTA 3
-- Obtener los 5 juegos activos con mayor puntaje.
-- ============================================================

SELECT
    j.titulo AS juego,
    c.nombre AS categoria,
    j.puntaje
FROM juegos AS j
INNER JOIN categorias AS c
    ON j.id_categoria = c.id_categoria
WHERE j.estado = 'activo'
ORDER BY j.puntaje DESC
LIMIT 5;


-- ============================================================
-- CONSULTA 4
-- Contar cuántos juegos activos existen por categoría.
-- ============================================================

SELECT
    c.nombre AS categoria,
    COUNT(j.id_juego) AS total_juegos
FROM categorias AS c
LEFT JOIN juegos AS j
    ON c.id_categoria = j.id_categoria
    AND j.estado = 'activo'
GROUP BY c.id_categoria, c.nombre
ORDER BY total_juegos DESC, c.nombre ASC;


-- ============================================================
-- CONSULTA 5
-- Obtener el puntaje promedio de los juegos activos
-- agrupado por categoría.
-- ============================================================

SELECT
    c.nombre AS categoria,
    COUNT(j.id_juego) AS total_juegos,
    ROUND(AVG(j.puntaje), 2) AS puntaje_promedio
FROM categorias AS c
INNER JOIN juegos AS j
    ON c.id_categoria = j.id_categoria
WHERE j.estado = 'activo'
GROUP BY c.id_categoria, c.nombre
ORDER BY puntaje_promedio DESC;


-- ============================================================
-- CONSULTA 6
-- Calcular el valor total de los juegos activos
-- registrados en la biblioteca.
-- ============================================================

SELECT
    COUNT(*) AS total_juegos_activos,
    ROUND(SUM(precio), 2) AS valor_total_biblioteca
FROM juegos
WHERE estado = 'activo';


-- ============================================================
-- CONSULTA 7
-- Mostrar los juegos activos cuyo precio sea menor a Q50
-- (el ejercicio utiliza precios como valores numéricos).
-- ============================================================

SELECT
    titulo AS juego,
    plataforma,
    precio,
    puntaje
FROM juegos
WHERE estado = 'activo'
  AND precio < 50.00
ORDER BY precio ASC;


-- ============================================================
-- CONSULTA 8
-- Mostrar las categorías que tienen al menos 2 juegos
-- registrados.
-- ============================================================

SELECT
    c.nombre AS categoria,
    COUNT(j.id_juego) AS total_juegos
FROM categorias AS c
INNER JOIN juegos AS j
    ON c.id_categoria = j.id_categoria
GROUP BY c.id_categoria, c.nombre
HAVING COUNT(j.id_juego) >= 2
ORDER BY total_juegos DESC;