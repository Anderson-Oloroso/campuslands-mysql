USE campuslands_mysql;

-- =========================================================
-- CONSULTA 1
-- Mostrar todos los dibujos digitales publicados.
-- =========================================================

SELECT
    id_dibujo,
    titulo,
    artista,
    categoria,
    programa,
    precio,
    estado
FROM dibujos_digitales
WHERE estado = 'publicado';


-- =========================================================
-- CONSULTA 2
-- Mostrar dibujos cuyo precio sea superior a Q400.
-- =========================================================

SELECT
    id_dibujo,
    titulo,
    artista,
    categoria,
    precio
FROM dibujos_digitales
WHERE precio > 400
ORDER BY precio DESC;


-- =========================================================
-- CONSULTA 3
-- Mostrar dibujos realizados con Procreate.
-- =========================================================

SELECT
    id_dibujo,
    titulo,
    artista,
    categoria,
    programa
FROM dibujos_digitales
WHERE programa = 'Procreate';


-- =========================================================
-- CONSULTA 4
-- Mostrar dibujos de la categoría Personaje
-- que todavía están en borrador.
-- =========================================================

SELECT
    id_dibujo,
    titulo,
    artista,
    categoria,
    horas_trabajo,
    estado
FROM dibujos_digitales
WHERE categoria = 'Personaje'
  AND estado = 'borrador';


-- =========================================================
-- CONSULTA 5
-- Mostrar dibujos que requieren más de 10 horas de trabajo.
-- =========================================================

SELECT
    id_dibujo,
    titulo,
    artista,
    horas_trabajo,
    precio
FROM dibujos_digitales
WHERE horas_trabajo > 10
ORDER BY horas_trabajo DESC;


-- =========================================================
-- CONSULTA 6
-- Mostrar dibujos publicados cuyo precio esté
-- entre Q250 y Q600.
-- =========================================================

SELECT
    id_dibujo,
    titulo,
    artista,
    precio,
    estado
FROM dibujos_digitales
WHERE estado = 'publicado'
  AND precio BETWEEN 250 AND 600
ORDER BY precio DESC;


-- =========================================================
-- CONSULTA 7
-- Mostrar la cantidad de dibujos por estado.
-- Se utiliza WHERE para excluir los registros archivados.
-- =========================================================

SELECT
    estado,
    COUNT(*) AS total_dibujos
FROM dibujos_digitales
WHERE estado <> 'archivado'
GROUP BY estado
ORDER BY total_dibujos DESC;