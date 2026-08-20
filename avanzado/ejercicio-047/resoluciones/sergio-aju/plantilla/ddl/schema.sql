-- Campuslands MySQL - avanzado ejercicio 047
-- Procedimientos Almacenados para Tienda de Ropa

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS detalle_ventas;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS prendas;
DROP TABLE IF EXISTS clientes;

-- Tabla de Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    tipo_cliente ENUM('regular', 'vip') NOT NULL DEFAULT 'regular',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabla de Prendas / Productos
CREATE TABLE prendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria ENUM('camisas', 'pantalones', 'chaquetas', 'calzado', 'accesorios') NOT NULL,
    talla VARCHAR(10) NOT NULL,
    color VARCHAR(40) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    estado ENUM('disponible', 'agotado', 'descontinuado') NOT NULL DEFAULT 'disponible',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0)
) ENGINE=InnoDB;

-- Tabla Encabezado de Ventas
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    descuento DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_total_valido CHECK (total >= 0)
) ENGINE=InnoDB;

-- Tabla Detalle de Ventas
CREATE TABLE detalle_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT NOT NULL,
    prenda_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (venta_id) REFERENCES ventas(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (prenda_id) REFERENCES prendas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_cantidad_positiva CHECK (cantidad > 0)
) ENGINE=InnoDB;

-- ============================================================================
-- PROCEDIMIENTOS ALMACENADOS (STORED PROCEDURES)
-- ============================================================================

DELIMITER //

-- SP 1: Registrar una venta completa y aplicar descuento automático si es cliente VIP
CREATE PROCEDURE sp_registrar_venta (
    IN p_cliente_id INT,
    IN p_prenda_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_stock INT;
    DECLARE v_tipo_cliente VARCHAR(20);
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_porcentaje_desc DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_descuento DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_venta_id INT;

    -- Obtener datos de la prenda
    SELECT precio, stock INTO v_precio, v_stock 
    FROM prendas WHERE id = p_prenda_id;

    -- Validar existencia y stock
    IF v_precio IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La prenda especificada no existe.';
    ELSEIF v_stock < p_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Stock insuficiente para realizar la venta.';
    ELSE
        -- Obtener tipo de cliente
        SELECT tipo_cliente INTO v_tipo_cliente FROM clientes WHERE id = p_cliente_id;

        -- Regla de negocio: 10% de descuento para clientes VIP
        IF v_tipo_cliente = 'vip' THEN
            SET v_porcentaje_desc = 0.10;
        END IF;

        SET v_subtotal = v_precio * p_cantidad;
        SET v_descuento = v_subtotal * v_porcentaje_desc;
        SET v_total = v_subtotal - v_descuento;

        -- Iniciar registro transaccional
        START TRANSACTION;

        INSERT INTO ventas (cliente_id, subtotal, descuento, total)
        VALUES (p_cliente_id, v_subtotal, v_descuento, v_total);

        SET v_venta_id = LAST_INSERT_ID();

        INSERT INTO detalle_ventas (venta_id, prenda_id, cantidad, precio_unitario)
        VALUES (v_venta_id, p_prenda_id, p_cantidad, v_precio);

        -- Actualizar stock
        UPDATE prendas 
        SET stock = stock - p_cantidad,
            estado = IF(stock - p_cantidad = 0, 'agotado', estado)
        WHERE id = p_prenda_id;

        COMMIT;
    END IF;
END //

-- SP 2: Reabastecer stock de prendas y actualizar estado
CREATE PROCEDURE sp_reabastecer_stock (
    IN p_prenda_id INT,
    IN p_cantidad_ingreso INT
)
BEGIN
    IF p_cantidad_ingreso <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La cantidad de reabastecimiento debe ser mayor a cero.';
    ELSE
        UPDATE prendas
        SET stock = stock + p_cantidad_ingreso,
            estado = 'disponible'
        WHERE id = p_prenda_id;
    END IF;
END //

-- SP 3: Reporte de inventario filtrado por categoría y rango de precio
CREATE PROCEDURE sp_reporte_inventario_categoria (
    IN p_categoria VARCHAR(50),
    IN p_precio_max DECIMAL(10,2)
)
BEGIN
    SELECT 
        id,
        nombre,
        categoria,
        talla,
        color,
        precio,
        stock,
        estado
    FROM prendas
    WHERE categoria = p_categoria
      AND precio <= p_precio_max
    ORDER BY precio DESC;
END //

DELIMITER ;