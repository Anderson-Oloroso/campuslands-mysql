SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS evt_expirar_cupones_vencidos;
DROP EVENT IF EXISTS evt_cancelar_pedidos_inactivos;

DELIMITER //

CREATE EVENT evt_expirar_cupones_vencidos
ON SCHEDULE EVERY 1 DAY
STARTS '2026-08-19 00:00:00'
DO
BEGIN
    DECLARE filas_modificadas INT DEFAULT 0;

    UPDATE cupones_descuento
    SET estado_cupon = 'Expirado'
    WHERE fecha_expiracion < NOW()
      AND estado_cupon = 'Activo';

    SET filas_modificadas = ROW_COUNT();

    INSERT INTO auditoria_eventos_tienda (nombre_evento, registros_afectados, detalles)
    VALUES ('evt_expirar_cupones_vencidos', filas_modificadas, 'Cupones vencidos actualizados a Expirado');
END //

CREATE EVENT evt_cancelar_pedidos_inactivos
ON SCHEDULE EVERY 1 HOUR
DO
BEGIN
    DECLARE filas_canceladas INT DEFAULT 0;

    UPDATE pedidos_cabecera
    SET estado_pedido = 'Cancelado_Expirado'
    WHERE estado_pedido = 'Pendiente'
      AND fecha_pedido < NOW() - INTERVAL 24 HOUR;

    SET filas_canceladas = ROW_COUNT();

    INSERT INTO auditoria_eventos_tienda (nombre_evento, registros_afectados, detalles)
    VALUES ('evt_cancelar_pedidos_inactivos', filas_canceladas, 'Pedidos pendientes con más de 24 horas cancelados');
END //

DELIMITER ;


SELECT 
    event_name,
    event_schema,
    interval_value,
    interval_field,
    status,
    event_type,
    starts
FROM information_schema.events
WHERE event_schema = DATABASE();

SELECT 
    cupon_id,
    codigo_cupon,
    porcentaje_descuento,
    fecha_expiracion,
    estado_cupon
FROM cupones_descuento
ORDER BY fecha_expiracion ASC;

SELECT 
    pedido_id,
    usuario_id,
    monto_total,
    estado_pedido,
    fecha_pedido
FROM pedidos_cabecera
ORDER BY fecha_pedido ASC;

SELECT 
    evento_id,
    nombre_evento,
    registros_afectados,
    detalles,
    fecha_ejecucion
FROM auditoria_eventos_tienda
ORDER BY fecha_ejecucion DESC;