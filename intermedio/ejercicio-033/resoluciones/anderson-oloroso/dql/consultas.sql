USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.arma_id, t1.nombre_arma, t1.tipo_arma, t2.nombre_skin, t2.rareza, t2.precio_puntos
FROM armas_shooter t1
INNER JOIN skins_shooter t2 ON t1.arma_id = t2.arma_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_arma, COUNT(t2.skin_id) AS total_relacionados
FROM armas_shooter t1
LEFT JOIN skins_shooter t2 ON t1.arma_id = t2.arma_id
GROUP BY t1.arma_id, t1.nombre_arma;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_arma, AVG(t2.precio_puntos) AS promedio_score
FROM armas_shooter t1
INNER JOIN skins_shooter t2 ON t1.arma_id = t2.arma_id
GROUP BY t1.arma_id, t1.nombre_arma
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_skin, rareza, precio_puntos
FROM skins_shooter
WHERE precio_puntos > (SELECT AVG(precio_puntos) FROM skins_shooter);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_armas_shooter AS
SELECT t1.nombre_arma, t1.tipo_arma, t2.nombre_skin, t2.precio_puntos
FROM armas_shooter t1
INNER JOIN skins_shooter t2 ON t1.arma_id = t2.arma_id;

SELECT * FROM vista_reporte_armas_shooter;
