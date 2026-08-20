CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS ev_revisar_productos_sin_movimiento;
DROP TABLE IF EXISTS alertas_inventario;
DROP TABLE IF EXISTS movimientos_inventario;
DROP TABLE IF EXISTS productos;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    ultima_actualizacion DATETIME NOT NULL,

    CONSTRAINT chk_precio_positivo
        CHECK (precio > 0),

    CONSTRAINT chk_stock_no_negativo
        CHECK (stock >= 0)
);

CREATE TABLE movimientos_inventario (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    tipo_movimiento ENUM('entrada', 'salida') NOT NULL,
    cantidad INT NOT NULL,
    fecha_movimiento DATETIME NOT NULL,

    CONSTRAINT fk_movimiento_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),

    CONSTRAINT chk_cantidad_positiva
        CHECK (cantidad > 0)
);

CREATE TABLE alertas_inventario (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    tipo_alerta VARCHAR(80) NOT NULL,
    mensaje VARCHAR(255) NOT NULL,
    fecha_alerta DATETIME NOT NULL,

    CONSTRAINT fk_alerta_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);

DELIMITER $$

CREATE EVENT ev_revisar_productos_sin_movimiento
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    INSERT INTO alertas_inventario (
        id_producto,
        tipo_alerta,
        mensaje,
        fecha_alerta
    )
    SELECT
        p.id_producto,
        'SIN_MOVIMIENTO',
        CONCAT(
            'El producto ',
            p.nombre,
            ' no registra movimiento reciente.'
        ),
        NOW()
    FROM productos AS p
    WHERE p.estado = 'activo'
      AND p.ultima_actualizacion < NOW() - INTERVAL 30 DAY
      AND NOT EXISTS (
          SELECT 1
          FROM alertas_inventario AS a
          WHERE a.id_producto = p.id_producto
            AND a.tipo_alerta = 'SIN_MOVIMIENTO'
            AND DATE(a.fecha_alerta) = CURDATE()
      );
END$$

DELIMITER ;