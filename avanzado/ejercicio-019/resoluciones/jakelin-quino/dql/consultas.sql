-- 1. Ver saltos actuales
SELECT * FROM `ejercicio-019-adv-saltos`;

-- 2. Insertar nuevo salto con procedimiento
CALL `sp_insertar_salto`('Juan', 4200, 30);

-- 3. Ver log de registros
SELECT * FROM `ejercicio-019-adv-log`;

