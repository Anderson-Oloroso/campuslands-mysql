INSERT INTO `ejercicio-055-adv-compuestos` VALUES 
(1, 'Agua', 'H2O', 18.02),
(2, 'Sal', 'NaCl', 58.44),
(3, 'Azucar', 'C12H22O11', 342.30);

-- Crear backup (tabla duplicada)
CREATE TABLE `ejercicio-055-adv-compuestos_backup` 
SELECT * FROM `ejercicio-055-adv-compuestos`;

-- Registrar backup
INSERT INTO `ejercicio-055-adv-backup` (registros) 
SELECT COUNT(*) FROM `ejercicio-055-adv-compuestos`;