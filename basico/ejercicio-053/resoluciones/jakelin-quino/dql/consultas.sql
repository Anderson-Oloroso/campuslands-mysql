-- 1. Ver edificios antes de actualizar
SELECT * FROM `ejercicio-053-bas-edificios`;

-- 2. Actualizar altura de Burj Khalifa
UPDATE `ejercicio-053-bas-edificios` SET altura = 830 WHERE nombre = 'Burj Khalifa';

-- 3. Actualizar costo de edificios con altura mayor a 600
UPDATE `ejercicio-053-bas-edificios` SET costo = costo * 1.10 WHERE altura > 600;

-- 4. Ver edificios después de actualizar
SELECT * FROM `ejercicio-053-bas-edificios`;