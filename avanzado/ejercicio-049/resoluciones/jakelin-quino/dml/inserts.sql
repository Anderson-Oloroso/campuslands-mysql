-- Datos iniciales
INSERT INTO `ejercicio-049-adv-saltos` VALUES 
(1, 'Carlos', 4000, 25),
(2, 'María', 3500, 18);

-- Procedimiento para insertar salto y registrar en log
DELIMITER //
CREATE PROCEDURE `sp_insertar_salto`(
    IN p_nombre VARCHAR(50),
    IN p_altura INT,
    IN p_saltos INT
)
BEGIN
    INSERT INTO `ejercicio-049-adv-saltos` (nombre, altura, saltos) 
    VALUES (p_nombre, p_altura, p_saltos);
    
    INSERT INTO `ejercicio-049-adv-log` (mensaje) 
    VALUES (CONCAT('Nuevo salto: ', p_nombre, ' - ', p_altura, 'm'));
END //
DELIMITER ;