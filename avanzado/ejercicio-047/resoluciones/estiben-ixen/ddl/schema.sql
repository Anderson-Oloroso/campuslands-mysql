-- Campuslands MySQL - avanzado ejercicio-047
-- Tema: tienda de ropa (procedimientos almacenados)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_tienda_ropa;
DROP TABLE IF EXISTS prendas_vestir;
DROP TABLE IF EXISTS marcas_ropa;

CREATE TABLE marcas_ropa (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origen VARCHAR(40) NOT NULL,
    segmento ENUM('Streetwear','Lujo','Deportivo','Casual','Formal') NOT NULL
);

CREATE TABLE prendas_vestir (
    id_prenda INT AUTO_INCREMENT PRIMARY KEY,
    nombre_articulo VARCHAR(80) NOT NULL,
    id_marca INT NOT NULL,
    talla ENUM('XS','S','M','L','XL','XXL') NOT NULL,
    color VARCHAR(30) NOT NULL,
    genero ENUM('Hombre','Mujer','Unisex') NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    stock_disponible INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_marca) REFERENCES marcas_ropa(id_marca) ON DELETE CASCADE
);

-- Procedimiento Almacenado
DROP PROCEDURE IF EXISTS sp_registrar_o_actualizar_tienda_ropa;
DELIMITER //
CREATE PROCEDURE sp_registrar_o_actualizar_tienda_ropa(
    IN p_nombre VARCHAR(80),
    IN p_id_ref INT,
    IN p_metrica DECIMAL(10,2),
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    
    SELECT COUNT(*) INTO v_existe 
    FROM marcas_ropa 
    WHERE id_marca = p_id_ref;
    
    IF v_existe > 0 THEN
        INSERT INTO prendas_vestir (nombre_articulo, id_marca, color)
        VALUES (p_nombre, p_id_ref, p_metrica);
        SET p_resultado = 'Registro insertado exitosamente con procedimiento.';
    ELSE
        SET p_resultado = 'Error: La entidad principal referenciada no existe.';
    END IF;
END //
DELIMITER ;
