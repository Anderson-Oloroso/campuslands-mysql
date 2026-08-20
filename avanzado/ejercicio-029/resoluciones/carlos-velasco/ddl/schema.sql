-- ============================================================
-- Ejercicio 029 - Event Scheduler
-- Tematica: Marketplace de accesorios
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS ev_desactivar_productos_sin_stock;
DROP TABLE IF EXISTS historial_productos;
DROP TABLE IF EXISTS productos;


-- ============================================================
-- Tabla principal
-- ============================================================

CREATE TABLE productos (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    fecha_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT chk_productos_precio
        CHECK (precio > 0)
) ENGINE = InnoDB;


-- ============================================================
-- Historial de estados
-- ============================================================

CREATE TABLE historial_productos (
    id_historial BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNSIGNED NOT NULL,
    estado_anterior ENUM('activo', 'inactivo') NOT NULL,
    estado_nuevo ENUM('activo', 'inactivo') NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_historial_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;


-- ============================================================
-- Event Scheduler
--
-- Desactiva automáticamente los productos activos que
-- tengan stock igual a cero.
-- ============================================================

SET GLOBAL event_scheduler = ON;

DELIMITER $$

CREATE EVENT ev_desactivar_productos_sin_stock
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN

    INSERT INTO historial_productos (
        id_producto,
        estado_anterior,
        estado_nuevo,
        motivo
    )
    SELECT
        id_producto,
        estado,
        'inactivo',
        'Producto desactivado automáticamente por falta de stock'
    FROM productos
    WHERE stock = 0
      AND estado = 'activo';

    UPDATE productos
    SET estado = 'inactivo'
    WHERE stock = 0
      AND estado = 'activo';

END$$

DELIMITER ;