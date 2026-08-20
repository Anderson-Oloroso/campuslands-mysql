-- ============================================================
-- Ejercicio 017 - Procedimientos almacenados para tienda de ropa
-- Base de datos: campuslands_mysql
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: productos
-- ------------------------------------------------------------
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_productos_precio
        CHECK (precio > 0),

    CONSTRAINT chk_productos_stock
        CHECK (stock >= 0)
);

-- ------------------------------------------------------------
-- Tabla: ventas
-- ------------------------------------------------------------
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'completada', 'cancelada')
        NOT NULL DEFAULT 'pendiente',
    total DECIMAL(10, 2) NOT NULL DEFAULT 0.00,

    CONSTRAINT chk_ventas_total
        CHECK (total >= 0)
);

-- ------------------------------------------------------------
-- Tabla: detalle_venta
-- ------------------------------------------------------------
CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,

    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta),

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),

    CONSTRAINT chk_detalle_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT chk_detalle_precio
        CHECK (precio_unitario > 0),

    CONSTRAINT uq_venta_producto
        UNIQUE (id_venta, id_producto)
);

-- ------------------------------------------------------------
-- Índices
-- ------------------------------------------------------------
CREATE INDEX idx_productos_categoria
    ON productos(categoria);

CREATE INDEX idx_productos_estado
    ON productos(estado);

CREATE INDEX idx_ventas_estado
    ON ventas(estado);

CREATE INDEX idx_ventas_fecha
    ON ventas(fecha_venta);

CREATE INDEX idx_detalle_venta
    ON detalle_venta(id_venta);


-- ============================================================
-- PROCEDIMIENTOS ALMACENADOS
-- ============================================================

DELIMITER $$

-- ------------------------------------------------------------
-- Procedimiento 1
-- Consultar productos activos de una categoría.
-- ------------------------------------------------------------
CREATE PROCEDURE sp_productos_por_categoria(
    IN p_categoria VARCHAR(50)
)
BEGIN
    SELECT
        id_producto,
        nombre,
        categoria,
        talla,
        precio,
        stock
    FROM productos
    WHERE categoria = p_categoria
      AND estado = 'activo'
    ORDER BY precio DESC;
END $$


-- ------------------------------------------------------------
-- Procedimiento 2
-- Consultar productos cuyo stock sea inferior o igual
-- al límite indicado.
-- ------------------------------------------------------------
CREATE PROCEDURE sp_productos_stock_bajo(
    IN p_limite_stock INT
)
BEGIN
    SELECT
        id_producto,
        nombre,
        categoria,
        talla,
        stock,
        precio
    FROM productos
    WHERE stock <= p_limite_stock
      AND estado = 'activo'
    ORDER BY stock ASC, nombre ASC;
END $$


-- ------------------------------------------------------------
-- Procedimiento 3
-- Registrar una venta sencilla y descontar inventario.
-- El procedimiento valida que el producto exista, esté activo
-- y tenga stock suficiente.
-- ------------------------------------------------------------
CREATE PROCEDURE sp_registrar_venta(
    IN p_cliente VARCHAR(100),
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(10, 2);
    DECLARE v_stock INT;
    DECLARE v_id_venta INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF p_cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La cantidad debe ser mayor que cero';
    END IF;

    SELECT
        precio,
        stock
    INTO
        v_precio,
        v_stock
    FROM productos
    WHERE id_producto = p_id_producto
      AND estado = 'activo'
    FOR UPDATE;

    IF v_precio IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El producto no existe o esta inactivo';
    END IF;

    IF v_stock < p_cantidad THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    END IF;

    START TRANSACTION;

    INSERT INTO ventas (
        cliente,
        fecha_venta,
        estado,
        total
    )
    VALUES (
        p_cliente,
        CURRENT_TIMESTAMP,
        'completada',
        v_precio * p_cantidad
    );

    SET v_id_venta = LAST_INSERT_ID();

    INSERT INTO detalle_venta (
        id_venta,
        id_producto,
        cantidad,
        precio_unitario
    )
    VALUES (
        v_id_venta,
        p_id_producto,
        p_cantidad,
        v_precio
    );

    UPDATE productos
    SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto;

    COMMIT;

    SELECT
        v_id_venta AS id_venta,
        p_cliente AS cliente,
        p_id_producto AS id_producto,
        p_cantidad AS cantidad,
        v_precio AS precio_unitario,
        v_precio * p_cantidad AS total;
END $$


-- ------------------------------------------------------------
-- Procedimiento 4
-- Obtener el resumen de ventas por cliente.
-- ------------------------------------------------------------
CREATE PROCEDURE sp_resumen_ventas_cliente(
    IN p_cliente VARCHAR(100)
)
BEGIN
    SELECT
        cliente,
        COUNT(*) AS total_ventas,
        SUM(total) AS monto_total,
        AVG(total) AS promedio_venta
    FROM ventas
    WHERE cliente = p_cliente
      AND estado = 'completada'
    GROUP BY cliente;
END $$

DELIMITER ;