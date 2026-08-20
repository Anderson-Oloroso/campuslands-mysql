USE campuslands_mysql;

-- 0. Sentencias DELETE controladas (Eliminaciones requeridas por el ejercicio)
-- Eliminar peleadores que se encuentran en estado 'retirado'
DELETE FROM peleadores_kickboxing 
WHERE estado = 'retirado';

-- Eliminar peleadores suspendidos que tengan más de 10 derrotas
DELETE FROM peleadores_kickboxing 
WHERE estado = 'suspendido' AND peleas_perdidas > 10;

-- 1. Listado general de peleadores activos ordenados por victorias descendente
SELECT nombre, categoria_peso, peleas_ganadas, estado
FROM peleadores_kickboxing
ORDER BY peleas_ganadas DESC;

-- 2. Conteo de peleadores agrupados por su categoría de peso
SELECT categoria_peso, COUNT(*) AS total_peleadores
FROM peleadores_kickboxing
GROUP BY categoria_peso;

-- 3. Top 3 peleadores con mayor cantidad de victorias (Ranking)
SELECT nombre, categoria_peso, peleas_ganadas
FROM peleadores_kickboxing
ORDER BY peleas_ganadas DESC
LIMIT 3;

-- 4. Promedio de peleas ganadas de los atletas registrados
SELECT AVG(peleas_ganadas) AS promedio_victorias
FROM peleadores_kickboxing;

-- 5. Peleadores activos con más de 20 victorias y menor cantidad de derrotas
SELECT nombre, categoria_peso, peleas_ganadas, peleas_perdidas
FROM peleadores_kickboxing
WHERE estado = 'activo' AND peleas_ganadas > 20
ORDER BY peleas_perdidas ASC;