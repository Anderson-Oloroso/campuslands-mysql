-- Campuslands MySQL - avanzado ejercicio 017
-- Contexto: Modulo de datos para tienda de ropa (Procedimientos Almacenados).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_avanz_017_registrar_venta;
DROP PROCEDURE IF EXISTS sp_avanz_017_reabastecer_stock;
DROP TABLE IF EXISTS avanzado_ejercicio_017_ventas;
DROP TABLE IF EXISTS avanzado_ejercicio_017_prendas;

CREATE TABLE avanzado_ejercicio_017_prendas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE avanzado_ejercicio_017_ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  prenda_id INT NOT NULL,
  cantidad INT NOT NULL,
  total DECIMAL(8,2) NOT NULL,
  fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (prenda_id) REFERENCES avanzado_ejercicio_017_prendas(id) ON DELETE CASCADE
);

-- Procedimiento 1: Registrar Venta 
DELIMITER //
CREATE PROCEDURE sp_avanz_017_registrar_venta(
    IN p_prenda_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_stock_actual INT;
    DECLARE v_precio DECIMAL(8,2);

    -- Obtener stock y precio actual de la prenda
    SELECT stock, precio INTO v_stock_actual, v_precio 
    FROM avanzado_ejercicio_017_prendas 
    WHERE id = p_prenda_id;

    -- Verificar que hay suficiente stock
    IF v_stock_actual < p_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Stock insuficiente para realizar la venta.';
    ELSE
        -- Bloque transaccional para asegurar la integridad de los datos
        START TRANSACTION;
        
        -- Insertar el registro en ventas calculando el total
        INSERT INTO avanzado_ejercicio_017_ventas (prenda_id, cantidad, total) 
        VALUES (p_prenda_id, p_cantidad, v_precio * p_cantidad);
        
        -- Descontar el stock del inventario
        UPDATE avanzado_ejercicio_017_prendas 
        SET stock = stock - p_cantidad 
        WHERE id = p_prenda_id;
        
        COMMIT;
    END IF;
END //
DELIMITER ;


-- Procedimiento 2: Reabastecer Inventario 
DELIMITER //
CREATE PROCEDURE sp_avanz_017_reabastecer_stock(
    IN p_prenda_id INT,
    IN p_cantidad_agregar INT
)
BEGIN
    IF p_cantidad_agregar <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cantidad a reabastecer debe ser mayor a 0.';
    ELSE
        UPDATE avanzado_ejercicio_017_prendas 
        SET stock = stock + p_cantidad_agregar 
        WHERE id = p_prenda_id;
    END IF;
END //
DELIMITER ;