-- 1. Funciones de fecha: mes y año
SELECT cliente, destino, 
       MONTHNAME(fecha) AS mes, YEAR(fecha) AS año
FROM `ejercicio-018-adv-reservas`;

-- 2. Funciones matemáticas: precio con IVA
SELECT cliente, destino, precio,
       ROUND(precio * 1.21, 2) AS precio_con_iva
FROM `ejercicio-018-adv-reservas`;

-- 3. Funciones de texto: cliente en mayúsculas
SELECT UPPER(cliente) AS cliente, destino, precio
FROM `ejercicio-018-adv-reservas`;