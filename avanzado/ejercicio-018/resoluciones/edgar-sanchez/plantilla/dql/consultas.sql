DROP FUNCTION IF EXISTS fn_calcular_descuento_temporada;
DROP FUNCTION IF EXISTS fn_obtener_costo_total_reserva;

DELIMITER //

CREATE FUNCTION fn_calcular_descuento_temporada(
    p_monto DECIMAL(10,2),
    p_numero_personas INT
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_descuento DECIMAL(10,2) DEFAULT 0.00;

    IF p_numero_personas >= 3 THEN
        SET v_descuento = p_monto * 0.15;
    ELSEIF p_numero_personas = 2 THEN
        SET v_descuento = p_monto * 0.05;
    ELSE
        SET v_descuento = 0.00;
    END IF;

    RETURN v_descuento;
END//

CREATE FUNCTION fn_obtener_costo_total_reserva(
    p_tour_id INT,
    p_numero_personas INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_precio_base DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_monto_subtotal DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_monto_descuento DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_monto_final DECIMAL(10,2) DEFAULT 0.00;

    SELECT precio_base_usd INTO v_precio_base
    FROM tours_disponibles
    WHERE tour_id = p_tour_id;

    IF v_precio_base IS NULL THEN
        RETURN 0.00;
    END IF;

    SET v_monto_subtotal = v_precio_base * p_numero_personas;
    SET v_monto_descuento = fn_calcular_descuento_temporada(v_monto_subtotal, p_numero_personas);
    SET v_monto_final = v_monto_subtotal - v_monto_descuento;

    RETURN v_monto_final;
END//

DELIMITER ;

SELECT 
    t.codigo_tour,
    t.nombre_tour,
    d.nombre_destino,
    t.precio_base_usd,
    3 AS personas_simuladas,
    (t.precio_base_usd * 3) AS subtotal_usd,
    fn_calcular_descuento_temporada(t.precio_base_usd * 3, 3) AS descuento_aplicado_usd,
    fn_obtener_costo_total_reserva(t.tour_id, 3) AS total_con_descuento_usd
FROM tours_disponibles t
INNER JOIN destinos_turisticos d ON t.destino_id = d.destino_id
ORDER BY t.tour_id ASC;

SELECT 
    r.codigo_reserva,
    tur.nombre_turista,
    tur.pasaporte,
    t.nombre_tour,
    r.fecha_reserva,
    r.fecha_viaje,
    DATEDIFF(r.fecha_viaje, r.fecha_reserva) AS dias_anticipacion_reserva,
    r.numero_personas,
    r.monto_total_usd AS monto_registrado_usd,
    fn_obtener_costo_total_reserva(r.tour_id, r.numero_personas) AS monto_recalculado_con_funcion_usd,
    r.estado_reserva
FROM reservas_tours r
INNER JOIN turistas tur ON r.turista_id = tur.turista_id
INNER JOIN tours_disponibles t ON r.tour_id = t.tour_id
ORDER BY r.reserva_id ASC;