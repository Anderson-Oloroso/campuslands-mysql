USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.personaje_id, t1.nombre_personaje, t1.especie, t2.nombre_mision, t2.dificultad, t2.recompensa
FROM personajes_scifi t1
INNER JOIN misiones_scifi t2 ON t1.personaje_id = t2.personaje_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_personaje, COUNT(t2.mision_id) AS total_relacionados
FROM personajes_scifi t1
LEFT JOIN misiones_scifi t2 ON t1.personaje_id = t2.personaje_id
GROUP BY t1.personaje_id, t1.nombre_personaje;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_personaje, AVG(t2.recompensa) AS promedio_score
FROM personajes_scifi t1
INNER JOIN misiones_scifi t2 ON t1.personaje_id = t2.personaje_id
GROUP BY t1.personaje_id, t1.nombre_personaje
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_mision, dificultad, recompensa
FROM misiones_scifi
WHERE recompensa > (SELECT AVG(recompensa) FROM misiones_scifi);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_personajes_scifi AS
SELECT t1.nombre_personaje, t1.especie, t2.nombre_mision, t2.recompensa
FROM personajes_scifi t1
INNER JOIN misiones_scifi t2 ON t1.personaje_id = t2.personaje_id;

SELECT * FROM vista_reporte_personajes_scifi;
