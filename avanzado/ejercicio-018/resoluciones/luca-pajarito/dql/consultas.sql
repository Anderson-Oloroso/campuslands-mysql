USE avanzado_viajes_turismo;

-- Limpieza de funciones si existen
DROP FUNCTION IF EXISTS fn_calcular_descuento_grupo;
DROP FUNCTION IF EXISTS fn_nivel_fidelidad_turista;
DROP FUNCTION IF EXISTS fn_obtener_fecha_retorno;

-- =============================================================================
-- FUNCION 1: Calcular precio total con descuento progresivo según el número de personas
-- =============================================================================
DELIMITER //
CREATE FUNCTION fn_calcular_descuento_grupo(
    p_precio_base DECIMAL(10, 2),
    p_personas INT
) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_subtotal DECIMAL(10, 2);
    DECLARE v_total_con_descuento DECIMAL(10, 2);
    
    SET v_subtotal = p_precio_base * p_personas;

    IF p_personas >= 4 THEN
        SET v_total_con_descuento = v_subtotal * 0.85; -- 15% de descuento
    ELSEIF p_personas >= 2 THEN
        SET v_total_con_descuento = v_subtotal * 0.93; -- 7% de descuento
    ELSE
        SET v_total_con_descuento = v_subtotal;
    END IF;

    RETURN v_total_con_descuento;
END //
DELIMITER ;


-- =============================================================================
-- FUNCION 2: Determinar la categoría VIP del turista en base al total gastado
-- =============================================================================
DELIMITER //
CREATE FUNCTION fn_nivel_fidelidad_turista(
    p_pasaporte VARCHAR(20)
)
RETURNS VARCHAR(30)
READS SQL DATA
BEGIN
    DECLARE v_monto_acumulado DECIMAL(10, 2);
    DECLARE v_categoria VARCHAR(30);

    SELECT IFNULL(SUM(monto_total), 0.00) INTO v_monto_acumulado
    FROM reservas_018
    WHERE turista_pasaporte = p_pasaporte;

    IF v_monto_acumulado >= 2000.00 THEN
        SET v_categoria = 'PLATINUM VIP';
    ELSEIF v_monto_acumulado >= 1000.00 THEN
        SET v_categoria = 'GOLD VIP';
    ELSEIF v_monto_acumulado > 0 THEN
        SET v_categoria = 'EXPLORADOR';
    ELSE
        SET v_categoria = 'SIN VIAJES';
    END IF;

    RETURN v_categoria;
END //
DELIMITER ;


-- =============================================================================
-- FUNCION 3: Calcular la fecha de retorno estimada según la duración del tour
-- =============================================================================
DELIMITER //
CREATE FUNCTION fn_obtener_fecha_retorno(
    p_fecha_reserva DATE,
    p_tour_id INT
)
RETURNS DATE
READS SQL DATA
BEGIN
    DECLARE v_dias INT;
    
    SELECT duracion_dias INTO v_dias
    FROM tours_018
    WHERE id = p_tour_id;

    RETURN DATE_ADD(p_fecha_reserva, INTERVAL v_dias DAY);
END //
DELIMITER ;


-- =============================================================================
-- CONSULTAS Y VERIFICACIÓN EVIDENCIABLE (DQL)
-- =============================================================================

-- Consulta 1: Transformación de texto nativa (Limpieza de cadenas)
SELECT 
    pasaporte,
    UPPER(nombre) AS nombre_mayusculas,
    LOWER(correo) AS correo_minusculas,
    CONCAT(UPPER(LEFT(nombre, 1)), SUBSTRING(LOWER(nombre), 2)) AS nombre_formateado
FROM turistas_018;

-- Consulta 2: Cálculo de antigüedad del cliente usando funciones nativas de fecha
SELECT 
    pasaporte,
    nombre,
    fecha_registro,
    DATEDIFF(CURRENT_DATE, fecha_registro) AS dias_registrado,
    TIMESTAMPDIFF(MONTH, fecha_registro, CURRENT_DATE) AS meses_registrado
FROM turistas_018;

-- Consulta 3: Demostración de `fn_calcular_descuento_grupo` (Simulación de cotización)
SELECT 
    t.nombre_tour,
    d.precio_base,
    4 AS cantidad_personas,
    fn_calcular_descuento_grupo(d.precio_base, 4) AS cotizacion_con_descuento
FROM tours_018 t
JOIN destinos_018 d ON t.destino_id = d.id;

-- Consulta 4: Demostración de `fn_nivel_fidelidad_turista` y `fn_obtener_fecha_retorno` en reporte de reservas
SELECT 
    r.id AS reserva_id,
    tu.nombre AS turista,
    fn_nivel_fidelidad_turista(tu.pasaporte) AS categoria_turista,
    t.nombre_tour,
    r.fecha_reserva,
    fn_obtener_fecha_retorno(r.fecha_reserva, r.tour_id) AS fecha_retorno_estimada,
    FORMAT(r.monto_total, 2) AS monto_formateado
FROM reservas_018 r
JOIN turistas_018 tu ON r.turista_pasaporte = tu.pasaporte
JOIN tours_018 t ON r.tour_id = t.id;

-- Consulta 5: Reporte de indicadores numéricos usando ROUND, CEIL, FLOOR y FORMAT
SELECT 
    d.nombre AS destino,
    AVG(r.monto_total) AS promedio_real,
    ROUND(AVG(r.monto_total), 1) AS promedio_redondeado,
    CEIL(AVG(r.monto_total)) AS promedio_techo,
    FLOOR(AVG(r.monto_total)) AS promedio_piso
FROM reservas_018 r
JOIN tours_018 t ON r.tour_id = t.id
JOIN destinos_018 d ON t.destino_id = d.id
GROUP BY d.id, d.nombre;