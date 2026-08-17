USE campuslands_mysql;

-- 1. Listado completo ordenado por talla y precio
SELECT id_prenda, nombre, talla, precio, stock, es_temporada_alta, fecha_ingreso
FROM prendas_basico
ORDER BY talla, precio DESC;

-- 2. Prendas de temporada alta ordenadas por precio
SELECT nombre, talla, precio, fecha_ingreso
FROM prendas_basico
WHERE es_temporada_alta = TRUE
ORDER BY precio DESC;

-- 3. Precio promedio y stock total por talla
SELECT talla, COUNT(*) AS total_prendas, AVG(precio) AS precio_promedio, SUM(stock) AS stock_total
FROM prendas_basico
GROUP BY talla
ORDER BY precio_promedio DESC;

-- 4. Prendas con bajo stock (menos de 10 unidades)
SELECT nombre, talla, stock
FROM prendas_basico
WHERE stock < 10
ORDER BY stock ASC;

-- 5. Top 3 prendas mas caras
SELECT nombre, talla, precio
FROM prendas_basico
ORDER BY precio DESC
LIMIT 3;

-- 6. Prendas ingresadas en el primer trimestre del año
SELECT nombre, fecha_ingreso
FROM prendas_basico
WHERE fecha_ingreso BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY fecha_ingreso;
