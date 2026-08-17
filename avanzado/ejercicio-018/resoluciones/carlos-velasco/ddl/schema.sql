-- ============================================================
-- Ejercicio 018 - Funciones SQL para viajes y turismo
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: destinos
-- ------------------------------------------------------------
CREATE TABLE destinos (
    id_destino INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    categoria ENUM(
        'playa',
        'montana',
        'ciudad',
        'aventura',
        'cultura'
    ) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

-- ------------------------------------------------------------
-- Tabla: viajes
-- ------------------------------------------------------------
CREATE TABLE viajes (
    id_viaje INT AUTO_INCREMENT PRIMARY KEY,
    id_destino INT NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    fecha_salida DATE NOT NULL,
    fecha_regreso DATE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cupos INT NOT NULL,
    estado ENUM('disponible', 'agotado', 'cancelado')
        NOT NULL DEFAULT 'disponible',

    CONSTRAINT fk_viajes_destino
        FOREIGN KEY (id_destino)
        REFERENCES destinos(id_destino),

    CONSTRAINT chk_viajes_fechas
        CHECK (fecha_regreso > fecha_salida),

    CONSTRAINT chk_viajes_precio
        CHECK (precio > 0),

    CONSTRAINT chk_viajes_cupos
        CHECK (cupos >= 0)
);

-- ------------------------------------------------------------
-- Tabla: reservas
-- ------------------------------------------------------------
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_viaje INT NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    cantidad_personas INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    estado ENUM('confirmada', 'pendiente', 'cancelada')
        NOT NULL DEFAULT 'pendiente',

    CONSTRAINT fk_reservas_viaje
        FOREIGN KEY (id_viaje)
        REFERENCES viajes(id_viaje),

    CONSTRAINT chk_reservas_personas
        CHECK (cantidad_personas > 0)
);

-- ------------------------------------------------------------
-- Índices
-- ------------------------------------------------------------
CREATE INDEX idx_destinos_pais
    ON destinos(pais);

CREATE INDEX idx_destinos_categoria
    ON destinos(categoria);

CREATE INDEX idx_viajes_fecha_salida
    ON viajes(fecha_salida);

CREATE INDEX idx_viajes_estado
    ON viajes(estado);

CREATE INDEX idx_reservas_viaje
    ON reservas(id_viaje);

CREATE INDEX idx_reservas_estado
    ON reservas(estado);


-- ============================================================
-- FUNCIONES SQL
-- ============================================================

DELIMITER $$

-- ------------------------------------------------------------
-- Función 1
-- Calcula la cantidad de días de duración de un viaje.
-- ------------------------------------------------------------
CREATE FUNCTION fn_duracion_viaje(
    p_fecha_salida DATE,
    p_fecha_regreso DATE
)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN DATEDIFF(p_fecha_regreso, p_fecha_salida);
END $$


-- ------------------------------------------------------------
-- Función 2
-- Calcula el descuento según la categoría del destino.
-- ------------------------------------------------------------
CREATE FUNCTION fn_porcentaje_descuento(
    p_categoria VARCHAR(50)
)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE v_descuento DECIMAL(5, 2);

    SET v_descuento = CASE p_categoria
        WHEN 'playa' THEN 0.10
        WHEN 'montana' THEN 0.15
        WHEN 'aventura' THEN 0.12
        WHEN 'cultura' THEN 0.08
        WHEN 'ciudad' THEN 0.05
        ELSE 0.00
    END;

    RETURN v_descuento;
END $$


-- ------------------------------------------------------------
-- Función 3
-- Calcula el precio final de un viaje aplicando
-- el descuento correspondiente a su categoría.
-- ------------------------------------------------------------
CREATE FUNCTION fn_precio_con_descuento(
    p_precio DECIMAL(10, 2),
    p_categoria VARCHAR(50)
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE v_descuento DECIMAL(5, 2);

    SET v_descuento = fn_porcentaje_descuento(p_categoria);

    RETURN ROUND(
        p_precio - (p_precio * v_descuento),
        2
    );
END $$

DELIMITER ;