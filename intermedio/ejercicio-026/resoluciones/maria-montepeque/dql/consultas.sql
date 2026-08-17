USE campuslands_mysql;

-- 1. Listado completo del catalogo de items
SELECT nombre, tipo, nivel_requerido, precio, danio, defensa, curacion
FROM items_intermedio
ORDER BY tipo, nivel_requerido;

-- 2. Armas ordenadas por daño
SELECT nombre, nivel_requerido, danio
FROM items_intermedio
WHERE tipo = 'arma'
ORDER BY danio DESC;

-- 3. Pociones ordenadas por curacion
SELECT nombre, precio, curacion
FROM items_intermedio
WHERE tipo = 'pocion'
ORDER BY curacion DESC;

-- 4. Items accesibles para un personaje de nivel 10
SELECT nombre, tipo, nivel_requerido
FROM items_intermedio
WHERE nivel_requerido <= 10
ORDER BY nivel_requerido DESC;

-- 5. Precio promedio por tipo de item
SELECT tipo, COUNT(*) AS total_items, AVG(precio) AS precio_promedio
FROM items_intermedio
GROUP BY tipo
ORDER BY precio_promedio DESC;

-- 6. Item mas caro de cada tipo
SELECT i.tipo, i.nombre, i.precio
FROM items_intermedio i
WHERE i.precio = (
  SELECT MAX(i2.precio) FROM items_intermedio i2 WHERE i2.tipo = i.tipo
)
ORDER BY i.precio DESC;

-- Nota de validacion manual: el CHECK cruzado impide mezclar
-- estadisticas de otro tipo. Por ejemplo:
--   INSERT INTO items_intermedio (nombre, tipo, nivel_requerido, precio, danio, defensa, curacion)
--   VALUES ('Espada Rota', 'arma', 3, 50, 20, 10, NULL);
-- da: ERROR 3819 (HY000): Check constraint
-- 'chk_items_intermedio_stats_por_tipo' is violated (una arma no puede
-- tener defensa). No se ejecuta aqui para no interrumpir el script.
