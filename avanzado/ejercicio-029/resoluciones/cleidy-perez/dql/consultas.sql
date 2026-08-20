DELIMITER //

CREATE EVENT IF NOT EXISTS evt_desactivar_ofertas_expiradas
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE productos
    SET precio_oferta = NULL,
        fin_oferta = NULL
    WHERE fin_oferta IS NOT NULL 
      AND fin_oferta < NOW();
END //

DELIMITER ;
