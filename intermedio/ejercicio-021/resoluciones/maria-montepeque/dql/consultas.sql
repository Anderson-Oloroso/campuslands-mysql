USE campuslands_mysql;

-- 1. Proyectos que usan una herramienta especifica (gracias a 1FN, es un filtro exacto)
SELECT p.titulo, a.nombre AS artista
FROM proyectos_digital_intermedio p
INNER JOIN herramientas_proyecto_intermedio h ON h.id_proyecto = p.id_proyecto
INNER JOIN artistas_digital_intermedio a ON a.id_artista = p.id_artista
WHERE h.herramienta = 'Photoshop';

-- 2. Cantidad de herramientas distintas usadas por proyecto
SELECT p.titulo, COUNT(h.id_herramienta) AS total_herramientas
FROM proyectos_digital_intermedio p
INNER JOIN herramientas_proyecto_intermedio h ON h.id_proyecto = p.id_proyecto
GROUP BY p.titulo
ORDER BY total_herramientas DESC;

-- 3. Herramienta mas usada en todos los proyectos
SELECT herramienta, COUNT(*) AS veces_usada
FROM herramientas_proyecto_intermedio
GROUP BY herramienta
ORDER BY veces_usada DESC
LIMIT 3;

-- 4. Proyectos de un artista especifico junto con sus herramientas
SELECT a.nombre AS artista, p.titulo, h.herramienta
FROM artistas_digital_intermedio a
INNER JOIN proyectos_digital_intermedio p ON p.id_artista = a.id_artista
INNER JOIN herramientas_proyecto_intermedio h ON h.id_proyecto = p.id_proyecto
WHERE a.nombre = 'Lucia Nieto'
ORDER BY p.titulo, h.herramienta;

-- 5. Artistas cuyos proyectos usan mas de 2 herramientas distintas en total (GROUP BY + HAVING)
SELECT a.nombre AS artista, COUNT(DISTINCT h.herramienta) AS herramientas_distintas
FROM artistas_digital_intermedio a
INNER JOIN proyectos_digital_intermedio p ON p.id_artista = a.id_artista
INNER JOIN herramientas_proyecto_intermedio h ON h.id_proyecto = p.id_proyecto
GROUP BY a.nombre
HAVING COUNT(DISTINCT h.herramienta) > 2
ORDER BY herramientas_distintas DESC;

-- 6. Vista "aplanada" armada al vuelo con GROUP_CONCAT, sin guardar los
-- datos de esa forma: la fuente sigue siendo atomica y normalizada.
SELECT p.titulo, GROUP_CONCAT(h.herramienta ORDER BY h.herramienta SEPARATOR ', ') AS herramientas_usadas
FROM proyectos_digital_intermedio p
INNER JOIN herramientas_proyecto_intermedio h ON h.id_proyecto = p.id_proyecto
GROUP BY p.titulo
ORDER BY p.titulo;
