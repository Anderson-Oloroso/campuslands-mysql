-- Consultas base. Completa o reemplaza segun el enunciado.
USE agencia_viajes;

DELIMITER //

-- Función 1: Calcular el costo total neto de una reserva considerando días, personas y descuento
DROP FUNCTION IF EXISTS fn_calcular_costo_reserva//

CREATE FUNCTION fn_calcular_costo_reserva(
    p_paquete_id INT,
    p_noches INT,
    p_personas INT
) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_precio DECIMAL(10, 2);
    DECLARE v_descuento DECIMAL(5, 2);
    DECLARE v_total DECIMAL(10, 2);

    SELECT precio_por_noche, descuento_porcentaje 
    INTO v_precio, v_descuento 
    FROM paquetes_turisticos 
    WHERE paquete_id = p_paquete_id;

    -- Cálculo: (Precio por noche * Noches * Personas) con el descuento aplicado
    SET v_total = (v_precio * p_noches * p_personas) * (1 - (v_descuento / 100));

    RETURN v_total;
END//

-- Función 2: Formatear la duración del viaje a texto
DROP FUNCTION IF EXISTS fn_categoria_duracion//

CREATE FUNCTION fn_categoria_duracion(p_noches INT) 
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    IF p_noches <= 3 THEN
        RETURN 'Escapada Corta';
    ELSEIF p_noches BETWEEN 4 AND 7 THEN
        RETURN 'Vacaciones Estándar';
    ELSE
        RETURN 'Estancia Prolongada';
    END IF;
END//

DELIMITER ;