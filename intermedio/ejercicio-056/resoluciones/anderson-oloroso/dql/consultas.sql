USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.personaje_id, t1.nombre_personaje, t1.clase, t2.nombre_objeto, t2.rareza, t2.valor_oro
FROM personajes_rpg t1
INNER JOIN inventario_rpg t2 ON t1.personaje_id = t2.personaje_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_personaje, COUNT(t2.item_id) AS total_relacionados
FROM personajes_rpg t1
LEFT JOIN inventario_rpg t2 ON t1.personaje_id = t2.personaje_id
GROUP BY t1.personaje_id, t1.nombre_personaje;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_personaje, AVG(t2.valor_oro) AS promedio_score
FROM personajes_rpg t1
INNER JOIN inventario_rpg t2 ON t1.personaje_id = t2.personaje_id
GROUP BY t1.personaje_id, t1.nombre_personaje
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_objeto, rareza, valor_oro
FROM inventario_rpg
WHERE valor_oro > (SELECT AVG(valor_oro) FROM inventario_rpg);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_personajes_rpg AS
SELECT t1.nombre_personaje, t1.clase, t2.nombre_objeto, t2.valor_oro
FROM personajes_rpg t1
INNER JOIN inventario_rpg t2 ON t1.personaje_id = t2.personaje_id;

SELECT * FROM vista_reporte_personajes_rpg;
