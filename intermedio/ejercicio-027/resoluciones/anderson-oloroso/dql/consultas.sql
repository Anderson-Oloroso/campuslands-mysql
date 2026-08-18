USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.nivel_id, t1.nombre_nivel, t1.mundo, t2.titulo_logro, t2.puntos_gamerscore, t2.desbloqueado
FROM niveles_aventura t1
INNER JOIN logros_nivel t2 ON t1.nivel_id = t2.nivel_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_nivel, COUNT(t2.logro_id) AS total_relacionados
FROM niveles_aventura t1
LEFT JOIN logros_nivel t2 ON t1.nivel_id = t2.nivel_id
GROUP BY t1.nivel_id, t1.nombre_nivel;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_nivel, AVG(t2.desbloqueado) AS promedio_score
FROM niveles_aventura t1
INNER JOIN logros_nivel t2 ON t1.nivel_id = t2.nivel_id
GROUP BY t1.nivel_id, t1.nombre_nivel
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT titulo_logro, puntos_gamerscore, desbloqueado
FROM logros_nivel
WHERE desbloqueado > (SELECT AVG(desbloqueado) FROM logros_nivel);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_niveles_aventura AS
SELECT t1.nombre_nivel, t1.mundo, t2.titulo_logro, t2.desbloqueado
FROM niveles_aventura t1
INNER JOIN logros_nivel t2 ON t1.nivel_id = t2.nivel_id;

SELECT * FROM vista_reporte_niveles_aventura;
