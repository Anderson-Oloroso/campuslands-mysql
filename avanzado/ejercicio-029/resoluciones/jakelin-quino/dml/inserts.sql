INSERT INTO `ejercicio-029-adv-productos` VALUES 
(1, 'Reloj', 50.00, 20, CURRENT_TIMESTAMP),
(2, 'Mochila', 35.00, 15, CURRENT_TIMESTAMP),
(3, 'Gafas', 25.00, 30, CURRENT_TIMESTAMP);

-- Procedimiento para actualizar stock
DELIMITER //
CREATE PROCEDURE `sp_actualizar_stock`()
BEGIN
    UPDATE `ejercicio-029-adv-productos` 
    SET stock = stock + 5,
        ultima_actualizacion = CURRENT_TIMESTAMP;
    
    INSERT INTO `ejercicio-029-adv_log` (mensaje) 
    VALUES ('Stock actualizado automáticamente');
END //
DELIMITER ;