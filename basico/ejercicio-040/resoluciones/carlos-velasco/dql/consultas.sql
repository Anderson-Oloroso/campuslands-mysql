USE campuslands_mysql;

-- =========================================================
-- CONSULTA 1: Cantidad total de carreras
-- =========================================================

SELECT
    COUNT(*) AS total_carreras
FROM carreras;


-- =========================================================
-- CONSULTA 2: Cantidad de corredores registrados
-- =========================================================

SELECT
    COUNT(*) AS total_corredores
FROM corredores;


-- =========================================================
-- CONSULTA 3: Cantidad de participaciones por carrera
-- =========================================================

SELECT
    c.nombre AS carrera,
    COUNT(p.id_participacion) AS total_participantes
FROM carreras AS c
LEFT JOIN participaciones AS p
    ON c.id_carrera = p.id_carrera
GROUP BY c.id_carrera, c.nombre
ORDER BY total_participantes DESC;


-- =========================================================
-- CONSULTA 4: Recaudacion estimada por carrera
-- =========================================================

SELECT
    c.nombre AS carrera,
    COUNT(p.id_participacion) AS participantes,
    SUM(c.costo_inscripcion) AS recaudacion
FROM carreras AS c
INNER JOIN participaciones AS p
    ON c.id_carrera = p.id_carrera
GROUP BY c.id_carrera, c.nombre
ORDER BY recaudacion DESC;


-- =========================================================
-- CONSULTA 5: Recaudacion total de todas las participaciones
-- =========================================================

SELECT
    SUM(c.costo_inscripcion) AS recaudacion_total
FROM carreras AS c
INNER JOIN participaciones AS p
    ON c.id_carrera = p.id_carrera;


-- =========================================================
-- CONSULTA 6: Cantidad de corredores por categoria
-- =========================================================

SELECT
    categoria,
    COUNT(*) AS total_corredores
FROM corredores
GROUP BY categoria
ORDER BY total_corredores DESC;


-- =========================================================
-- CONSULTA 7: Total de kilometros de carreras programadas
-- =========================================================

SELECT
    COUNT(*) AS carreras_programadas,
    SUM(distancia_km) AS kilometros_totales
FROM carreras
WHERE estado = 'programada';