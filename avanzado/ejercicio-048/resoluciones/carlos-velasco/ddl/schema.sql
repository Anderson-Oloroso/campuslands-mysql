CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP FUNCTION IF EXISTS fn_calcular_precio_final;

DROP TABLE IF EXISTS viajes;

CREATE TABLE viajes (
    id_viaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    fecha_salida DATE NOT NULL,
    duracion_dias INT UNSIGNED NOT NULL,
    precio_base DECIMAL(10, 2) NOT NULL,
    descuento_porcentaje DECIMAL(5, 2) NOT NULL DEFAULT 0.00,
    estado ENUM('disponible', 'reservado', 'finalizado') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_duracion_viaje
        CHECK (duracion_dias > 0),

    CONSTRAINT chk_precio_base_viaje
        CHECK (precio_base >= 0),

    CONSTRAINT chk_descuento_viaje
        CHECK (
            descuento_porcentaje >= 0
            AND descuento_porcentaje <= 100
        )
);

DELIMITER $$

CREATE FUNCTION fn_calcular_precio_final(
    precio DECIMAL(10, 2),
    descuento DECIMAL(5, 2)
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN ROUND(
        precio - (precio * descuento / 100),
        2
    );
END$$

DELIMITER ;