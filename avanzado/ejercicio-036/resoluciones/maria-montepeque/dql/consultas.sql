USE campuslands_mysql;

-- 1. EXPLAIN: filtro directo por la columna indexada 'marca'
EXPLAIN
SELECT id_encargo, cliente, precio
FROM encargos_avanzado
WHERE marca = 'Ferrari';

-- 2. EXPLAIN: el mismo filtro, pero envuelto en una funcion sobre la
-- columna indexada. MySQL ya no puede usar el indice tal cual, porque
-- tendria que calcular UPPER(marca) fila por fila antes de comparar.
EXPLAIN
SELECT id_encargo, cliente, precio
FROM encargos_avanzado
WHERE UPPER(marca) = 'FERRARI';

-- 3. EXPLAIN: filtro por marca + rango de fechas (usa el indice compuesto completo)
EXPLAIN
SELECT id_encargo, cliente, precio, fecha_encargo
FROM encargos_avanzado
WHERE marca = 'Lamborghini' AND fecha_encargo BETWEEN '2026-01-01' AND '2026-02-28';

-- 4. EXPLAIN: filtrar por marca y ordenar por una columna que SI esta
-- en el indice compuesto (fecha_encargo), evitando un ordenamiento aparte
EXPLAIN
SELECT id_encargo, fecha_encargo, precio
FROM encargos_avanzado
WHERE marca = 'McLaren'
ORDER BY fecha_encargo;

-- 5. EXPLAIN: filtrar por marca y ordenar por una columna que NO esta
-- en el indice (cliente); se espera 'Using filesort' en Extra
EXPLAIN
SELECT id_encargo, cliente, precio
FROM encargos_avanzado
WHERE marca = 'McLaren'
ORDER BY cliente;

-- 6. EXPLAIN ANALYZE: ejecuta la consulta de verdad y muestra tiempos
-- y filas reales examinadas, no solo el plan estimado.
EXPLAIN ANALYZE
SELECT cliente, COUNT(*) AS total, SUM(precio) AS gasto_total
FROM encargos_avanzado
WHERE cliente = 'Coleccion Andina'
GROUP BY cliente;
