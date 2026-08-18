-- 1. Ver productos iniciales
SELECT * FROM `ejercicio-047-adv-productos`;

-- 2. Realizar venta con transacción manual
START TRANSACTION;
UPDATE `ejercicio-047-adv-productos` SET stock = stock - 2 WHERE id = 1;
INSERT INTO `ejercicio-047-adv-ventas` (producto_id, cantidad) VALUES (1, 2);
COMMIT;

START TRANSACTION;
UPDATE `ejercicio-047-adv-productos` SET stock = stock - 1 WHERE id = 2;
INSERT INTO `ejercicio-047-adv-ventas` (producto_id, cantidad) VALUES (2, 1);
COMMIT;

-- 3. Ver productos y ventas después
SELECT * FROM `ejercicio-047-adv-productos`;
SELECT * FROM `ejercicio-047-adv-ventas`;