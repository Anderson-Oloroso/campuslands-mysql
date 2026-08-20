CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminación previa de objetos si existen para permitir re-ejecución limpia
DROP FUNCTION IF EXISTS fn_calcular_precio_con_descuento;
DROP TABLE IF EXISTS skins_shooter;

CREATE TABLE skins_shooter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_arma VARCHAR(60) NOT NULL,
    nombre_skin VARCHAR(100) NOT NULL,
    rareza ENUM('comun', 'rara', 'epica', 'legendaria', 'mitica') NOT NULL,
    precio_base DECIMAL(10, 2) NOT NULL,
    descuento_porcentaje DECIMAL(5, 2) DEFAULT 0.00,
    estado ENUM('disponible', 'agotada', 'coleccion_exclusiva') DEFAULT 'disponible',
    CONSTRAINT chk_precio_base CHECK (precio_base >= 0),
    CONSTRAINT chk_descuento CHECK (descuento_porcentaje BETWEEN 0 AND 100)
);

-- Creación de la función almacenada avanzada para calcular el precio final con descuento aplicado
DELIMITER //

CREATE FUNCTION fn_calcular_precio_con_descuento(
    p_precio DECIMAL(10, 2),
    p_descuento DECIMAL(5, 2)
) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_precio_final DECIMAL(10, 2);
    SET v_precio_final = p_precio - (p_precio * (p_descuento / 100));
    RETURN v_precio_final;
END //

DELIMITER ;