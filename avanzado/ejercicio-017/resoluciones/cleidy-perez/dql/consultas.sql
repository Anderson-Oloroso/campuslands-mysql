-- Consultas base. Completa o reemplaza segun el enunciado.
DELIMITER //

-- ============================================================
-- 1. SP: Obtener todos los clientes y sus compras
-- ============================================================
DROP PROCEDURE IF EXISTS sp_obtener_clientes_ventas//

CREATE PROCEDURE sp_obtener_clientes_ventas()
BEGIN
    SELECT 
        c.cliente_id,
        c.nombre AS nombre_cliente,
        c.email,
        p.nombre AS producto_comprado,
        v.cantidad,
        v.fecha_venta
    FROM clientes c
    LEFT JOIN ventas v ON c.cliente_id = v.cliente_id
    LEFT JOIN productos p ON v.producto_id = p.producto_id;
END//

DROP PROCEDURE IF EXISTS sp_registrar_venta//

CREATE PROCEDURE sp_registrar_venta(
    IN p_cliente_id INT,
    IN p_producto_id INT,
    IN p_cantidad INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO ventas (cliente_id, producto_id, fecha_venta, cantidad)
    VALUES (p_cliente_id, p_producto_id, p_fecha, p_cantidad);
END//

-- Restauramos el delimitador estándar
DELIMITER ;

CALL sp_obtener_clientes_ventas();

CALL sp_registrar_venta(4, 2, 1, '2026-02-16');