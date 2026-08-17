USE campuslands_mysql;

-- 1. Total vendido e ingresos por arma
SELECT arma, COUNT(*) AS total_ventas, SUM(precio) AS ingresos
FROM ventas_skins_intermedio
GROUP BY arma
ORDER BY ingresos DESC;

-- 2. Ingresos por rareza, solo las que superan 50 en total (GROUP BY + HAVING)
SELECT rareza, SUM(precio) AS ingresos
FROM ventas_skins_intermedio
GROUP BY rareza
HAVING SUM(precio) > 50
ORDER BY ingresos DESC;

-- 3. Ventas por mes
SELECT MONTHNAME(fecha_venta) AS mes, COUNT(*) AS total_ventas, SUM(precio) AS ingresos
FROM ventas_skins_intermedio
GROUP BY MONTH(fecha_venta), MONTHNAME(fecha_venta)
ORDER BY MONTH(fecha_venta);

-- 4. Skin mas vendida por cantidad de transacciones
SELECT nombre_skin, COUNT(*) AS veces_vendida
FROM ventas_skins_intermedio
GROUP BY nombre_skin
ORDER BY veces_vendida DESC
LIMIT 3;

-- 5. Total gastado por comprador
SELECT comprador, SUM(precio) AS total_gastado
FROM ventas_skins_intermedio
GROUP BY comprador
ORDER BY total_gastado DESC;

-- 6. Compradores con mas de una compra (GROUP BY + HAVING)
SELECT comprador, COUNT(*) AS total_compras
FROM ventas_skins_intermedio
GROUP BY comprador
HAVING COUNT(*) > 1
ORDER BY total_compras DESC;
