-- DDL: Estructura de tablas y funciones personalizadas para viajes y turismo
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP FUNCTION IF EXISTS calcular_dias_viaje;
DROP FUNCTION IF EXISTS calcular_precio_con_descuento;

DROP TABLE IF EXISTS reservas_turismo;
DROP TABLE IF EXISTS paquetes_turismo;

CREATE TABLE paquetes_turismo (
    paquete_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_paquete VARCHAR(20) NOT NULL UNIQUE,
    destino VARCHAR(100) NOT NULL,
    categoria ENUM('playa', 'montaña', 'cultural', 'aventura', 'ecoturismo') NOT NULL,
    precio_por_noche DECIMAL(8,2) NOT NULL CHECK (precio_por_noche > 0.00),
    cupos_disponibles INT NOT NULL DEFAULT 0 CHECK (cupos_disponibles >= 0)
) ENGINE=InnoDB;

CREATE TABLE reservas_turismo (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    paquete_id INT NOT NULL,
    cliente_nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    numero_personas INT NOT NULL CHECK (numero_personas > 0),
    monto_total DECIMAL(10,2) NOT NULL CHECK (monto_total >= 0.00),
    FOREIGN KEY (paquete_id) REFERENCES paquetes_turismo(paquete_id) ON DELETE CASCADE,
    CONSTRAINT chk_fechas_reserva CHECK (fecha_fin > fecha_inicio)
) ENGINE=InnoDB;

-- FUNCION ALMACENADA 1: Calcular duracion total del viaje en dias
DELIMITER //
CREATE FUNCTION calcular_dias_viaje(p_inicio DATE, p_fin DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(p_fin, p_inicio);
END //
DELIMITER ;

-- FUNCION ALMACENADA 2: Calcular precio total aplicando descuento por grupo (>3 personas)
DELIMITER //
CREATE FUNCTION calcular_precio_con_descuento(
    p_precio_noche DECIMAL(8,2),
    p_dias INT,
    p_personas INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_descuento DECIMAL(4,2) DEFAULT 0.00;

    SET v_subtotal = p_precio_noche * p_dias * p_personas;

    IF p_personas >= 4 THEN
        SET v_descuento = 0.15; -- 15% descuento a grupos grandes
    ELSEIF p_personas = 3 THEN
        SET v_descuento = 0.10; -- 10% descuento
    END IF;

    RETURN v_subtotal * (1 - v_descuento);
END //
DELIMITER ;
