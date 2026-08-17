USE campuslands_mysql;

-- 1. Funciones de texto: nombre en mayusculas y un codigo de
-- transaccion generado con CONCAT + SUBSTRING + LPAD
SELECT id_transaccion,
       UPPER(nombre_skin) AS skin,
       CONCAT('TX-', LPAD(id_transaccion, 5, '0')) AS codigo_transaccion
FROM mercado_skins_avanzado
ORDER BY id_transaccion;

-- 2. Funciones de fecha: dias que se tuvo el skin antes de venderlo
SELECT nombre_skin, fecha_compra, fecha_venta,
       DATEDIFF(fecha_venta, fecha_compra) AS dias_en_posesion
FROM mercado_skins_avanzado
ORDER BY dias_en_posesion DESC;

-- 3. Funciones numericas: ganancia o perdida y margen porcentual
SELECT nombre_skin, precio_compra, precio_venta,
       ROUND(precio_venta - precio_compra, 2) AS ganancia,
       ROUND((precio_venta - precio_compra) / precio_compra * 100, 1) AS margen_porcentual
FROM mercado_skins_avanzado
ORDER BY margen_porcentual DESC;

-- 4. Promedio de dias en posesion antes de vender (agregacion + funcion de fecha)
SELECT ROUND(AVG(DATEDIFF(fecha_venta, fecha_compra)), 1) AS promedio_dias_en_posesion
FROM mercado_skins_avanzado;

-- 5. Dominio de correo mas frecuente entre los compradores
SELECT SUBSTRING_INDEX(comprador_email, '@', -1) AS dominio_correo, COUNT(*) AS total_transacciones
FROM mercado_skins_avanzado
GROUP BY dominio_correo
ORDER BY total_transacciones DESC;

-- 6. Clasificar cada transaccion como ganancia o perdida (CASE)
SELECT nombre_skin, precio_compra, precio_venta,
       CASE
         WHEN precio_venta > precio_compra THEN 'ganancia'
         WHEN precio_venta < precio_compra THEN 'perdida'
         ELSE 'sin cambio'
       END AS resultado
FROM mercado_skins_avanzado
ORDER BY resultado, nombre_skin;
