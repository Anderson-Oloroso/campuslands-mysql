-- 1. Ver inventario antes de vender
SELECT * FROM `ejercicio-046-adv-inventario`;

-- 2. Vender productos
CALL `sp_vender`('Hamburguesa', 2);
CALL `sp_vender`('Pizza', 1);

-- 3. Ver inventario después de vender
SELECT * FROM `ejercicio-046-adv-inventario`;

-- 4. Ver historial de ventas
SELECT * FROM `ejercicio-046-adv-ventas`;