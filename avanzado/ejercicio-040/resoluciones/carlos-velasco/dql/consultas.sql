USE campuslands_mysql;

-- =========================================================
-- CONSULTA 1: Verificar cantidad de carreras
-- =========================================================

SELECT
    COUNT(*) AS total_carreras
FROM carreras;


-- =========================================================
-- CONSULTA 2: Verificar cantidad de corredores
-- =========================================================

SELECT
    COUNT(*) AS total_corredores
FROM corredores;


-- =========================================================
-- CONSULTA 3: Participantes por carrera
-- =========================================================

SELECT
    c.nombre AS carrera,
    COUNT(p.id_participacion) AS total_participantes
FROM carreras AS c
LEFT JOIN participaciones AS p
    ON c.id_carrera = p.id_carrera
GROUP BY
    c.id_carrera,
    c.nombre
ORDER BY
    total_participantes DESC;


-- =========================================================
-- CONSULTA 4: Recaudacion por carrera
-- =========================================================

SELECT
    c.nombre AS carrera,
    COUNT(p.id_participacion) AS participantes,
    SUM(c.costo_inscripcion) AS recaudacion
FROM carreras AS c
INNER JOIN participaciones AS p
    ON c.id_carrera = p.id_carrera
GROUP BY
    c.id_carrera,
    c.nombre
ORDER BY
    recaudacion DESC;


-- =========================================================
-- CONSULTA 5: Total de kilometros programados
-- =========================================================

SELECT
    COUNT(*) AS carreras_programadas,
    SUM(distancia_km) AS kilometros_totales
FROM carreras
WHERE estado = 'programada';


-- =========================================================
-- CONSULTA 6: Corredores por categoria
-- =========================================================

SELECT
    categoria,
    COUNT(*) AS total_corredores
FROM corredores
GROUP BY categoria
ORDER BY total_corredores DESC;


-- =========================================================
-- CONSULTA 7: Informacion completa de participaciones
-- =========================================================

SELECT
    p.id_participacion,
    c.nombre AS carrera,
    co.nombre AS corredor,
    co.categoria,
    p.posicion_final,
    p.tiempo_minutos
FROM participaciones AS p
INNER JOIN carreras AS c
    ON p.id_carrera = c.id_carrera
INNER JOIN corredores AS co
    ON p.id_corredor = co.id_corredor
ORDER BY
    c.fecha_carrera,
    p.posicion_final;


-- =========================================================
-- CONSULTA 8: Verificar estructura antes del backup
-- =========================================================

SHOW TABLES;

DESCRIBE carreras;
DESCRIBE corredores;
DESCRIBE participaciones;