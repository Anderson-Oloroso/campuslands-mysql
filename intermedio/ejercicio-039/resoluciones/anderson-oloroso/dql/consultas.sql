USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.peleador_id, t1.nombre_peleador, t1.categoria_peso, t2.evento, t2.resultado, t2.round_final
FROM peleadores_kickboxing t1
INNER JOIN combates_kickboxing t2 ON t1.peleador_id = t2.peleador_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_peleador, COUNT(t2.combate_id) AS total_relacionados
FROM peleadores_kickboxing t1
LEFT JOIN combates_kickboxing t2 ON t1.peleador_id = t2.peleador_id
GROUP BY t1.peleador_id, t1.nombre_peleador;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_peleador, AVG(t2.round_final) AS promedio_score
FROM peleadores_kickboxing t1
INNER JOIN combates_kickboxing t2 ON t1.peleador_id = t2.peleador_id
GROUP BY t1.peleador_id, t1.nombre_peleador
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT evento, resultado, round_final
FROM combates_kickboxing
WHERE round_final > (SELECT AVG(round_final) FROM combates_kickboxing);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_peleadores_kickboxing AS
SELECT t1.nombre_peleador, t1.categoria_peso, t2.evento, t2.round_final
FROM peleadores_kickboxing t1
INNER JOIN combates_kickboxing t2 ON t1.peleador_id = t2.peleador_id;

SELECT * FROM vista_reporte_peleadores_kickboxing;
