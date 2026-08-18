DELIMITER //

CREATE EVENT IF NOT EXISTS evt_mantenimiento_diario_marketplace
ON SCHEDULE EVERY 1 DAY
STARTS (TIMESTAMP(CURRENT_DATE) + INTERVAL 23 HOUR + INTERVAL 59 MINUTE)
DO
BEGIN
    DECLARE ofertas_eliminadas INT DEFAULT 0;
    DECLARE carritos_eliminados INT DEFAULT 0;

    -- Contar y actualizar ofertas vencidas
    SELECT COUNT(*) INTO ofertas_eliminadas 
    FROM productos 
    WHERE fin_oferta IS NOT NULL AND fin_oferta < NOW();

    UPDATE productos 
    SET precio_oferta = NULL, fin_oferta = NULL 
    WHERE fin_oferta IS NOT NULL AND fin_oferta < NOW();

    -- Contar y depurar carritos antiguos
    SELECT COUNT(*) INTO carritos_eliminados 
    FROM carrito_compras 
    WHERE fecha_actualizacion < NOW() - INTERVAL 30 DAY;

    DELETE FROM carrito_compras 
    WHERE fecha_actualizacion < NOW() - INTERVAL 30 DAY;

    -- Insertar resumen en la tabla de auditoría
    INSERT INTO log_metricas_diarias (total_ofertas_expiradas, carritos_depurados)
    VALUES (ofertas_eliminadas, carritos_eliminados);
END //

DELIMITER ;
