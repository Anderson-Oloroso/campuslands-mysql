USE academia_kickboxing;

-- 1. Luchadores activos ordenados por victorias
SELECT nombre, victorias FROM luchadores WHERE estado = 'activo' ORDER BY victorias DESC;

-- 2. Luchadores con su categoría (JOIN)
SELECT l.nombre, c.nombre AS categoria, l.victorias FROM luchadores l JOIN categorias c ON l.id_categoria = c.id_categoria;

-- 3. Total de luchadores por categoría
SELECT c.nombre, COUNT(l.id_luchador) AS total FROM categorias c LEFT JOIN luchadores l ON c.id_categoria = l.id_categoria GROUP BY c.nombre;

-- 4. Top 3 histórico
SELECT nombre, victorias, estado FROM luchadores ORDER BY victorias DESC LIMIT 3;

-- 5. Promedio de victorias actuales
SELECT AVG(victorias) AS prom_victorias FROM luchadores WHERE estado = 'activo';