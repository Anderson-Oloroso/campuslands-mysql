USE campuslands_mysql;

-- 1. Obras que usan una herramienta especifica (gracias a 1FN, es un filtro exacto)
SELECT o.titulo, i.nombre AS ilustrador
FROM obras_intermedio o
INNER JOIN materiales_obra_intermedio m ON m.id_obra = o.id_obra
INNER JOIN ilustradores_intermedio i ON i.id_ilustrador = o.id_ilustrador
WHERE m.herramienta = 'Photoshop';

-- 2. Cantidad de herramientas distintas usadas por obra
SELECT o.titulo, COUNT(m.id_material) AS total_herramientas
FROM obras_intermedio o
INNER JOIN materiales_obra_intermedio m ON m.id_obra = o.id_obra
GROUP BY o.titulo
ORDER BY total_herramientas DESC;

-- 3. Herramienta mas usada en todas las obras
SELECT herramienta, COUNT(*) AS veces_usada
FROM materiales_obra_intermedio
GROUP BY herramienta
ORDER BY veces_usada DESC
LIMIT 3;

-- 4. Obras de un ilustrador especifico junto con sus herramientas
SELECT i.nombre AS ilustrador, o.titulo, m.herramienta
FROM ilustradores_intermedio i
INNER JOIN obras_intermedio o ON o.id_ilustrador = i.id_ilustrador
INNER JOIN materiales_obra_intermedio m ON m.id_obra = o.id_obra
WHERE i.nombre = 'Camila Rendon'
ORDER BY o.titulo, m.herramienta;

-- 5. Ilustradores cuyas obras usan mas de 2 herramientas distintas en total (GROUP BY + HAVING)
SELECT i.nombre AS ilustrador, COUNT(DISTINCT m.herramienta) AS herramientas_distintas
FROM ilustradores_intermedio i
INNER JOIN obras_intermedio o ON o.id_ilustrador = i.id_ilustrador
INNER JOIN materiales_obra_intermedio m ON m.id_obra = o.id_obra
GROUP BY i.nombre
HAVING COUNT(DISTINCT m.herramienta) > 2
ORDER BY herramientas_distintas DESC;

-- 6. Vista "aplanada" armada al vuelo con GROUP_CONCAT, sin guardar los
-- datos de esa forma: la fuente sigue siendo atomica y normalizada.
SELECT o.titulo, GROUP_CONCAT(m.herramienta ORDER BY m.herramienta SEPARATOR ', ') AS herramientas_usadas
FROM obras_intermedio o
INNER JOIN materiales_obra_intermedio m ON m.id_obra = o.id_obra
GROUP BY o.titulo
ORDER BY o.titulo;
