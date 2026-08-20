-- 1. Ver productos antes de actualizar
SELECT * FROM `ejercicio-059-adv-productos`;

-- 2. Ejecutar procedimiento manualmente
CALL `sp_actualizar_stock`();

-- 3. Ver productos después y log
SELECT * FROM `ejercicio-059-adv-productos`;
SELECT * FROM `ejercicio-059-adv_log`;