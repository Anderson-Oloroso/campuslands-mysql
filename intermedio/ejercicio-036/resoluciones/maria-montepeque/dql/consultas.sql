USE campuslands_mysql;

-- 1. Autos que tienen una caracteristica especifica (gracias a 1FN, filtro exacto)
SELECT a.marca, a.modelo
FROM autos_intermedio a
INNER JOIN caracteristicas_auto_intermedio c ON c.id_auto = a.id_auto
WHERE c.caracteristica = 'Freno ceramico';

-- 2. Cantidad de caracteristicas por auto
SELECT a.modelo, COUNT(c.id_caracteristica) AS total_caracteristicas
FROM autos_intermedio a
INNER JOIN caracteristicas_auto_intermedio c ON c.id_auto = a.id_auto
GROUP BY a.modelo
ORDER BY total_caracteristicas DESC;

-- 3. Caracteristica mas comun entre todos los autos
SELECT caracteristica, COUNT(*) AS veces_presente
FROM caracteristicas_auto_intermedio
GROUP BY caracteristica
ORDER BY veces_presente DESC
LIMIT 3;

-- 4. Caracteristicas de un auto especifico
SELECT a.modelo, c.caracteristica
FROM autos_intermedio a
INNER JOIN caracteristicas_auto_intermedio c ON c.id_auto = a.id_auto
WHERE a.modelo = 'Chiron'
ORDER BY c.caracteristica;

-- 5. Autos con mas de 2 caracteristicas registradas (GROUP BY + HAVING)
SELECT a.modelo, COUNT(*) AS total_caracteristicas
FROM autos_intermedio a
INNER JOIN caracteristicas_auto_intermedio c ON c.id_auto = a.id_auto
GROUP BY a.modelo
HAVING COUNT(*) > 2
ORDER BY total_caracteristicas DESC;

-- 6. Vista "aplanada" armada al vuelo con GROUP_CONCAT, sin guardar los
-- datos de esa forma: la fuente sigue siendo atomica y normalizada.
SELECT a.modelo, GROUP_CONCAT(c.caracteristica ORDER BY c.caracteristica SEPARATOR ', ') AS caracteristicas
FROM autos_intermedio a
INNER JOIN caracteristicas_auto_intermedio c ON c.id_auto = a.id_auto
GROUP BY a.modelo
ORDER BY a.modelo;
