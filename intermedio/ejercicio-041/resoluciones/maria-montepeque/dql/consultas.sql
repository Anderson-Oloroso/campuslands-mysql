USE campuslands_mysql;

-- 1. Listado completo del catalogo de equipamiento
SELECT nombre, tipo, precio, velocidad, rebote, dimension_cm
FROM equipamiento_pingpong_intermedio
ORDER BY tipo, precio;

-- 2. Raquetas ordenadas por velocidad
SELECT nombre, precio, velocidad
FROM equipamiento_pingpong_intermedio
WHERE tipo = 'raqueta'
ORDER BY velocidad DESC;

-- 3. Pelotas ordenadas por rebote
SELECT nombre, precio, rebote
FROM equipamiento_pingpong_intermedio
WHERE tipo = 'pelota'
ORDER BY rebote DESC;

-- 4. Equipamiento economico (precio de 50000 o menos)
SELECT nombre, tipo, precio
FROM equipamiento_pingpong_intermedio
WHERE precio <= 50000
ORDER BY precio ASC;

-- 5. Precio promedio por tipo de equipamiento
SELECT tipo, COUNT(*) AS total_items, AVG(precio) AS precio_promedio
FROM equipamiento_pingpong_intermedio
GROUP BY tipo
ORDER BY precio_promedio DESC;

-- 6. Item mas caro de cada tipo
SELECT e.tipo, e.nombre, e.precio
FROM equipamiento_pingpong_intermedio e
WHERE e.precio = (
  SELECT MAX(e2.precio) FROM equipamiento_pingpong_intermedio e2 WHERE e2.tipo = e.tipo
)
ORDER BY e.precio DESC;

-- Nota de validacion manual: el CHECK cruzado impide mezclar
-- estadisticas de otro tipo. Por ejemplo:
--   INSERT INTO equipamiento_pingpong_intermedio (nombre, tipo, precio, velocidad, rebote, dimension_cm)
--   VALUES ('Raqueta Rota', 'raqueta', 50000, 80, 70, NULL);
-- da: ERROR 3819 (HY000): Check constraint
-- 'chk_equipamiento_intermedio_stats_por_tipo' is violated (una
-- raqueta no puede tener rebote). No se ejecuta aqui para no
-- interrumpir el script.
