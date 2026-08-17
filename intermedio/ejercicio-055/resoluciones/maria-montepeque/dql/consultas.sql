USE campuslands_mysql;

-- 1. Listado de compuestos con su codigo unico
SELECT id_compuesto, codigo_compuesto, nombre_compuesto, categoria, estado_fisico
FROM compuestos_lab_intermedio
ORDER BY codigo_compuesto;

-- 2. Evidencia de que 'L-001' se repite entre compuestos distintos (permitido)
SELECT c.codigo_compuesto, l.numero_lote, l.cantidad_producida
FROM lotes_produccion_intermedio l
INNER JOIN compuestos_lab_intermedio c ON c.id_compuesto = l.id_compuesto
WHERE l.numero_lote = 'L-001'
ORDER BY c.codigo_compuesto;

-- 3. Cantidad total producida por compuesto
SELECT c.codigo_compuesto, c.nombre_compuesto, SUM(l.cantidad_producida) AS total_producido
FROM lotes_produccion_intermedio l
INNER JOIN compuestos_lab_intermedio c ON c.id_compuesto = l.id_compuesto
GROUP BY c.codigo_compuesto, c.nombre_compuesto
ORDER BY total_producido DESC;

-- 4. Compuestos por categoria
SELECT categoria, COUNT(*) AS total_compuestos
FROM compuestos_lab_intermedio
GROUP BY categoria
ORDER BY total_compuestos DESC;

-- 5. Lotes producidos por cada compuesto, ordenados por fecha
SELECT c.codigo_compuesto, l.numero_lote, l.fecha_produccion
FROM lotes_produccion_intermedio l
INNER JOIN compuestos_lab_intermedio c ON c.id_compuesto = l.id_compuesto
ORDER BY c.codigo_compuesto, l.fecha_produccion;

-- 6. Compuesto con mayor produccion acumulada
SELECT c.codigo_compuesto, c.nombre_compuesto, SUM(l.cantidad_producida) AS total_producido
FROM lotes_produccion_intermedio l
INNER JOIN compuestos_lab_intermedio c ON c.id_compuesto = l.id_compuesto
GROUP BY c.codigo_compuesto, c.nombre_compuesto
ORDER BY total_producido DESC
LIMIT 1;

-- Notas de validacion manual (verificadas al preparar esta resolucion):
--   INSERT INTO compuestos_lab_intermedio (codigo_compuesto, nombre_compuesto, categoria, estado_fisico)
--   VALUES ('H2SO4', 'Otro nombre', 'acido', 'liquido');
--   -> ERROR 1062 (23000): Duplicate entry 'H2SO4' for key
--      'compuestos_lab_intermedio.codigo_compuesto'
--
--   INSERT INTO lotes_produccion_intermedio (id_compuesto, numero_lote, cantidad_producida, fecha_produccion)
--   VALUES (1, 'L-001', 10.00, '2026-03-01');
--   -> ERROR 1062 (23000): Duplicate entry '1-L-001' for key
--      'lotes_produccion_intermedio.uq_lotes_produccion_intermedio_lote'
-- (no se ejecutan aqui para no interrumpir el script).
