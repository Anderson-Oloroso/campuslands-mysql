-- Campuslands MySQL - Avanzado Ejercicio 018
-- Temática: Viajes y Turismo (Uso de Funciones Almacenadas)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reservas;
DROP TABLE IF EXISTS paquetes_turisticos;

CREATE TABLE paquetes_turisticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    duracion_dias INT NOT NULL DEFAULT 1,
    precio_por_dia DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    puntaje DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paquete_id INT NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    personas INT NOT NULL DEFAULT 1,
    descuento_porcentaje DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    fecha_reserva DATE NOT NULL,
    FOREIGN KEY (paquete_id) REFERENCES paquetes_turisticos(id)
);

-- ==========================================
-- FUNCIONES ALMACENADAS (STORED FUNCTIONS)
-- ==========================================

-- 1. Función para calcular el costo total base de un paquete (precio_por_dia * duracion)
DELIMITER //
CREATE FUNCTION fn_calcular_costo_base(
    p_paquete_id INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_costo_total DECIMAL(10,2) DEFAULT 0.00;
    
    SELECT (duracion_dias * precio_por_dia) INTO v_costo_total
    FROM paquetes_turisticos
    WHERE id = p_paquete_id;
    
    RETURN v_costo_total;
END //
DELIMITER ;

-- 2. Función para calcular el total final a pagar en una reserva aplicando descuento y número de personas
DELIMITER //
CREATE FUNCTION fn_calcular_total_reserva(
    p_reserva_id INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2) DEFAULT 0.00;
    
    SELECT 
        (pt.duracion_dias * pt.precio_por_dia * r.personas) * (1 - (r.descuento_porcentaje / 100))
    INTO v_total
    FROM reservas r
    INNER JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
    WHERE r.id = p_reserva_id;
    
    RETURN IFNULL(v_total, 0.00);
END //
DELIMITER ;

-- 3. Función para clasificar la categoría de precio según el costo total del viaje
DELIMITER //
CREATE FUNCTION fn_clasificar_categoria_precio(
    p_costo DECIMAL(10,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF p_costo < 400.00 THEN
        RETURN 'Económico';
    ELSEIF p_costo BETWEEN 400.00 AND 800.00 THEN
        RETURN 'Estándar';
    ELSE
        RETURN 'Premium';
    END IF;
END //
DELIMITER ;