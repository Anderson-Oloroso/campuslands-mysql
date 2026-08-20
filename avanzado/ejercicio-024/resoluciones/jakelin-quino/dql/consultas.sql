-- 1. Ver proyectos iniciales
SELECT * FROM `ejercicio-024-adv-proyectos`;

-- 2. Transacción con bloqueo FOR UPDATE
START TRANSACTION;
SELECT * FROM `ejercicio-024-adv-proyectos` WHERE id = 1 FOR UPDATE;
UPDATE `ejercicio-024-adv-proyectos` SET temperatura = 1600 WHERE id = 1;
COMMIT;

-- 3. Ver proyectos después del bloqueo
SELECT * FROM `ejercicio-024-adv-proyectos`;