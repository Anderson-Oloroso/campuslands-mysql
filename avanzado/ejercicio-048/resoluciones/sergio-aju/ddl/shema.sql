-- Campuslands MySQL - avanzado ejercicio 048
-- Funciones SQL para Agencia de Viajes y Turismo

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reservas;
DROP TABLE IF EXISTS paquetes_turisticos;
DROP TABLE IF EXISTS clientes;

-- Tabla de Clientes / Turistas
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(60) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabla de Paquetes Turísticos
CREATE TABLE paquetes_turisticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    destino VARCHAR(80) NOT NULL,
    categoria ENUM('Playa', 'Aventura', 'Cultural', 'Ecoturismo') NOT NULL,
    precio_por_noche DECIMAL(10,2) NOT NULL,
    es_temporada_alta TINYINT(1) NOT NULL DEFAULT 0,
    estado ENUM('disponible', 'agotado', 'inactivo') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_precio_noche_positivo CHECK (precio_por_noche >= 0)
) ENGINE=InnoDB;

-- Tabla de Reservas
CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    paquete_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    numero_personas INT NOT NULL DEFAULT 1,
    estado_reserva ENUM('confirmada', 'pendiente', 'cancelada') NOT NULL DEFAULT 'confirmada',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (paquete_id) REFERENCES paquetes_turisticos(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_fechas_coherentes CHECK (fecha_fin > fecha_inicio),
    CONSTRAINT chk_personas_positivas CHECK (numero_personas > 0)
) ENGINE=InnoDB;

-- ============================================================================
-- FUNCIONES ALMACENADAS DE USUARIO (STORED FUNCTIONS)
-- ============================================================================

DELIMITER //

-- Función 1: Calcular número total de días de hospedaje entre dos fechas
CREATE FUNCTION fn_calcular_dias_estancia(
    p_fecha_inicio DATE,
    p_fecha_fin DATE
) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(p_fecha_fin, p_fecha_inicio);
END //

-- Función 2: Calcular costo total de una reserva aplicando recargo si es temporada alta
CREATE FUNCTION fn_calcular_costo_reserva(
    p_precio_noche DECIMAL(10,2),
    p_dias INT,
    p_personas INT,
    p_es_temporada_alta TINYINT(1)
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_factor_temporada DECIMAL(3,2) DEFAULT 1.00;
    
    IF p_es_temporada_alta = 1 THEN
        SET v_factor_temporada = 1.20; -- 20% de incremento en temporada alta
    END IF;

    SET v_subtotal = (p_precio_noche * p_dias * p_personas) * v_factor_temporada;
    RETURN ROUND(v_subtotal, 2);
END //

-- Función 3: Clasificar la gama del paquete según su precio por noche
CREATE FUNCTION fn_clasificar_gama_paquete(
    p_precio DECIMAL(10,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE v_gama VARCHAR(20);

    IF p_precio < 100.00 THEN
        SET v_gama = 'Económica';
    ELSEIF p_precio BETWEEN 100.00 AND 250.00 THEN
        SET v_gama = 'Estándar';
    ELSE
        SET v_gama = 'Premium / Lujo';
    END IF;

    RETURN v_gama;
END //

DELIMITER ;