-- DDL: Estructura de tablas y procedimientos almacenados para tienda de ropa
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS registrar_venta_ropa;
DROP PROCEDURE IF EXISTS reabastecer_stock_ropa;

DROP TABLE IF EXISTS detalle_ventas_ropa;
DROP TABLE IF EXISTS ventas_ropa;
DROP TABLE IF EXISTS productos_ropa;

CREATE TABLE productos_ropa (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('camisas', 'pantalones', 'chaquetas', 'vestidos', 'calzado') NOT NULL,
    talla ENUM('XS', 'S', 'M', 'L', 'XL') NOT NULL,
    precio DECIMAL(8,2) NOT NULL CHECK (precio > 0.00),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
) ENGINE=InnoDB;

CREATE TABLE ventas_ropa (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nombre VARCHAR(100) NOT NULL,
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    monto_total DECIMAL(10,2) DEFAULT 0.00 CHECK (monto_total >= 0.00)
) ENGINE=InnoDB;

CREATE TABLE detalle_ventas_ropa (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(8,2) NOT NULL CHECK (precio_unitario > 0.00),
    FOREIGN KEY (venta_id) REFERENCES ventas_ropa(venta_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos_ropa(producto_id)
) ENGINE=InnoDB;

-- PROCEDIMIENTO ALMACENADO 1: Registrar una venta y actualizar stock
DELIMITER //
CREATE PROCEDURE registrar_venta_ropa(
    IN p_cliente VARCHAR(100),
    IN p_producto_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(8,2);
    DECLARE v_stock_actual INT;
    DECLARE v_venta_id INT;

    SELECT precio, stock INTO v_precio, v_stock_actual
    FROM productos_ropa
    WHERE producto_id = p_producto_id;

    IF v_stock_actual >= p_cantidad THEN
        START TRANSACTION;

        INSERT INTO ventas_ropa (cliente_nombre, monto_total)
        VALUES (p_cliente, v_precio * p_cantidad);

        SET v_venta_id = LAST_INSERT_ID();

        INSERT INTO detalle_ventas_ropa (venta_id, producto_id, cantidad, precio_unitario)
        VALUES (v_venta_id, p_producto_id, p_cantidad, v_precio);

        UPDATE productos_ropa
        SET stock = stock - p_cantidad
        WHERE producto_id = p_producto_id;

        COMMIT;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Stock insuficiente para procesar la venta.';
    END IF;
END //
DELIMITER ;

-- PROCEDIMIENTO ALMACENADO 2: Reabastecer inventario de una prenda
DELIMITER //
CREATE PROCEDURE reabastecer_stock_ropa(
    IN p_producto_id INT,
    IN p_cantidad_nueva INT
)
BEGIN
    IF p_cantidad_nueva > 0 THEN
        UPDATE productos_ropa
        SET stock = stock + p_cantidad_nueva
        WHERE producto_id = p_producto_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La cantidad a reabastecer debe ser mayor a cero.';
    END IF;
END //
DELIMITER ;
