DROP PROCEDURE IF EXISTS sp_registrar_venta_ropa;
DROP PROCEDURE IF EXISTS sp_reponer_stock_prenda;

DELIMITER //

CREATE PROCEDURE sp_registrar_venta_ropa(
    IN p_cliente_id INT,
    IN p_prenda_id INT,
    IN p_cantidad INT,
    OUT p_venta_id INT,
    OUT p_mensaje VARCHAR(150)
)
sp_main: BEGIN
    DECLARE v_stock INT DEFAULT 0;
    DECLARE v_precio DECIMAL(8,2) DEFAULT 0.00;
    DECLARE v_subtotal DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_puntos_ganados INT DEFAULT 0;

    IF p_cantidad <= 0 THEN
        SET p_venta_id = NULL;
        SET p_mensaje = 'Error: La cantidad vendida debe ser mayor a cero.';
        LEAVE sp_main;
    END IF;

    SELECT stock_actual, precio_unitario INTO v_stock, v_precio
    FROM prendas_inventario
    WHERE prenda_id = p_prenda_id;

    IF v_precio IS NULL THEN
        SET p_venta_id = NULL;
        SET p_mensaje = 'Error: La prenda especificada no existe en el inventario.';
        LEAVE sp_main;
    END IF;

    IF v_stock < p_cantidad THEN
        SET p_venta_id = NULL;
        SET p_mensaje = CONCAT('Error: Stock insuficiente. Stock disponible: ', v_stock);
        LEAVE sp_main;
    END IF;

    SET v_subtotal = v_precio * p_cantidad;
    SET v_puntos_ganados = FLOOR(v_subtotal / 10);

    START TRANSACTION;

    INSERT INTO ventas (cliente_id, fecha_venta, monto_total, estado_venta)
    VALUES (p_cliente_id, CURRENT_TIMESTAMP, v_subtotal, 'Completada');

    SET p_venta_id = LAST_INSERT_ID();

    INSERT INTO ventas_detalle (venta_id, prenda_id, cantidad, precio_historico, subtotal)
    VALUES (p_venta_id, p_prenda_id, p_cantidad, v_precio, v_subtotal);

    UPDATE prendas_inventario
    SET stock_actual = stock_actual - p_cantidad
    WHERE prenda_id = p_prenda_id;

    UPDATE clientes_tienda
    SET puntos_fidelidad = puntos_fidelidad + v_puntos_ganados
    WHERE cliente_id = p_cliente_id;

    COMMIT;

    SET p_mensaje = CONCAT('Venta registrada exitosamente. Puntos sumados: ', v_puntos_ganados);
END//

CREATE PROCEDURE sp_reponer_stock_prenda(
    IN p_prenda_id INT,
    IN p_cantidad_reponer INT,
    OUT p_nuevo_stock INT,
    OUT p_mensaje VARCHAR(150)
)
sp_reponer: BEGIN
    DECLARE v_prenda_existe INT DEFAULT 0;

    IF p_cantidad_reponer <= 0 THEN
        SET p_nuevo_stock = NULL;
        SET p_mensaje = 'Error: La cantidad a reponer debe ser mayor a cero.';
        LEAVE sp_reponer;
    END IF;

    SELECT COUNT(*) INTO v_prenda_existe
    FROM prendas_inventario
    WHERE prenda_id = p_prenda_id;

    IF v_prenda_existe = 0 THEN
        SET p_nuevo_stock = NULL;
        SET p_mensaje = 'Error: La prenda especificada no existe en el inventario.';
        LEAVE sp_reponer;
    END IF;

    START TRANSACTION;

    UPDATE prendas_inventario
    SET stock_actual = stock_actual + p_cantidad_reponer
    WHERE prenda_id = p_prenda_id;

    SELECT stock_actual INTO p_nuevo_stock
    FROM prendas_inventario
    WHERE prenda_id = p_prenda_id;

    COMMIT;

    SET p_mensaje = CONCAT('Stock actualizado con éxito. Incremento: +', p_cantidad_reponer);
END//

DELIMITER ;

CALL sp_registrar_venta_ropa(3, 4, 2, @nueva_venta_id, @mensaje_resultado);
SELECT @nueva_venta_id AS id_venta_generada, @mensaje_resultado AS resultado_operacion;

CALL sp_reponer_stock_prenda(2, 20, @stock_final, @mensaje_reposicion);
SELECT @stock_final AS nuevo_stock_prenda, @mensaje_reposicion AS resultado_reposicion;
SELECT 
    v.venta_id,
    v.fecha_venta,
    c.nombre_cliente,
    c.correo,
    c.puntos_fidelidad AS puntos_fidelidad_actuales,
    v.monto_total,
    v.estado_venta
FROM ventas v
INNER JOIN clientes_tienda c ON v.cliente_id = c.cliente_id
ORDER BY v.venta_id DESC;

SELECT 
    p.prenda_id,
    p.codigo_sku,
    p.nombre_prenda,
    cat.nombre_categoria,
    p.talla,
    p.color,
    p.precio_unitario,
    p.stock_actual
FROM prendas_inventario p
INNER JOIN categorias_ropa cat ON p.categoria_id = cat.categoria_id
ORDER BY p.prenda_id ASC;