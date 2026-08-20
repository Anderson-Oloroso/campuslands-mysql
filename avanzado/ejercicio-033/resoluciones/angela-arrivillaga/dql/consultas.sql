USE campuslands_mysql;

-- 1. promedio de precio base y descuento por rareza para skins disponibles
SELECT rareza, AVG(precio_base) AS promedio_precio, AVG(descuento_porcentaje) AS promedio_descuento
FROM skins_shooter
WHERE estado != 'agotada'
GROUP BY rareza;

-- 2. top 3 skins más costosas del inventario aplicando la función de precio final
SELECT nombre_arma, nombre_skin, rareza, precio_base, fn_calcular_precio_con_descuento(precio_base, descuento_porcentaje) AS precio_final
FROM skins_shooter
ORDER BY precio_final DESC
LIMIT 3;

-- 3. listado detallado de skins filtradas por una rareza específica
SELECT nombre_arma, nombre_skin, precio_base, descuento_porcentaje, estado
FROM skins_shooter
WHERE rareza = 'legendaria'
ORDER BY precio_base DESC;

-- 4. reporte analítico agrupado por estado actual con conteo y precio base total acumulado
SELECT estado, COUNT(*) AS cantidad_skins, SUM(precio_base) AS valor_total_inventario
FROM skins_shooter
GROUP BY estado;

-- 5. listado completo utilizando la función SQL para verificar el costo final con descuento de todo el catálogo
SELECT nombre_arma, nombre_skin, rareza, precio_base, descuento_porcentaje, 
       fn_calcular_precio_con_descuento(precio_base, descuento_porcentaje) AS precio_final, 
       estado
FROM skins_shooter
ORDER BY rareza;