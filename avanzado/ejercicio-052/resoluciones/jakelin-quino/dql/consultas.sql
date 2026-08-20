-- 1. Vista con presupuesto total por estudio
CREATE VIEW `v_presupuesto_estudio` AS
SELECT estudio, SUM(presupuesto) AS total_presupuesto
FROM `ejercicio-052-adv-proyectos`
GROUP BY estudio;

-- 2. Vista con personajes y su proyecto
CREATE VIEW `v_personajes_proyecto` AS
SELECT p.nombre AS proyecto, pe.nombre AS personaje, pe.poligonos, pe.tiempo_animacion
FROM `ejercicio-052-adv-personajes` pe
INNER JOIN `ejercicio-052-adv-proyectos` p ON pe.proyecto_id = p.id;

-- 3. Vista con estadísticas por proyecto
CREATE VIEW `v_estadisticas_proyecto` AS
SELECT p.nombre, COUNT(pe.id) AS total_personajes, 
       AVG(pe.poligonos) AS promedio_poligonos
FROM `ejercicio-052-adv-proyectos` p
LEFT JOIN `ejercicio-052-adv-personajes` pe ON p.id = pe.proyecto_id
GROUP BY p.id;

-- Consultar vistas
SELECT * FROM `v_presupuesto_estudio`;
SELECT * FROM `v_personajes_proyecto`;
SELECT * FROM `v_estadisticas_proyecto`;