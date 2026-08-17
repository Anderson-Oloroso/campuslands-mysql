USE campuslands_mysql;

-- 1. EXPLAIN: filtro directo por la columna indexada 'artista'
EXPLAIN
SELECT id_comision, cliente, tipo_arte, precio
FROM comisiones_avanzado
WHERE artista = 'Camila Rendon';

-- 2. EXPLAIN: el mismo filtro, pero envuelto en una funcion sobre la
-- columna indexada. MySQL ya no puede usar el indice tal cual, porque
-- tendria que calcular UPPER(artista) fila por fila antes de comparar.
EXPLAIN
SELECT id_comision, cliente, tipo_arte, precio
FROM comisiones_avanzado
WHERE UPPER(artista) = 'CAMILA RENDON';

-- 3. EXPLAIN: filtro por artista + rango de fechas (usa el indice compuesto completo)
EXPLAIN
SELECT id_comision, cliente, precio, fecha_encargo
FROM comisiones_avanzado
WHERE artista = 'Nicolas Duarte' AND fecha_encargo BETWEEN '2026-01-01' AND '2026-02-28';

-- 4. EXPLAIN: filtrar por artista y ordenar por una columna que SI esta
-- en el indice compuesto (fecha_encargo), evitando un ordenamiento aparte
EXPLAIN
SELECT id_comision, fecha_encargo, precio
FROM comisiones_avanzado
WHERE artista = 'Isabela Franco'
ORDER BY fecha_encargo;

-- 5. EXPLAIN: filtrar por artista y ordenar por una columna que NO esta
-- en el indice (cliente); se espera 'Using filesort' en Extra
EXPLAIN
SELECT id_comision, cliente, precio
FROM comisiones_avanzado
WHERE artista = 'Isabela Franco'
ORDER BY cliente;

-- 6. EXPLAIN ANALYZE: ejecuta la consulta de verdad y muestra tiempos
-- y filas reales examinadas, no solo el plan estimado.
EXPLAIN ANALYZE
SELECT tipo_arte, COUNT(*) AS total, SUM(precio) AS ingresos
FROM comisiones_avanzado
WHERE tipo_arte = 'pixel_art'
GROUP BY tipo_arte;
