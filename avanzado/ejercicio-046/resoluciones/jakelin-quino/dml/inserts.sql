INSERT INTO `ejercicio-046-adv-inventario` VALUES 
(1, 'Hamburguesa', 10),
(2, 'Pizza', 5),
(3, 'Sushi', 3);

-- Procedimiento con transacción
DELIMITER //
CREATE PROCEDURE `sp_vender`(IN p_producto VARCHAR(50), IN p_cantidad INT)
BEGIN
    START TRANSACTION;
    
    UPDATE `ejercicio-046-adv-inventario` 
    SET cantidad = cantidad - p_cantidad 
    WHERE producto = p_producto;
    
    INSERT INTO `ejercicio-046-adv-ventas` (producto, cantidad) 
    VALUES (p_producto, p_cantidad);
    
    COMMIT;
END //
DELIMITER ;