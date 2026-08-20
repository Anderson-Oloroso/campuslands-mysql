CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS actualizar_revision_productos;
DROP TABLE IF EXISTS productos_accesorios;

CREATE TABLE productos_accesorios (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    ultima_revision DATETIME NOT NULL,
    CONSTRAINT chk_precio_positivo CHECK (precio > 0),
    CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0)
);

SET GLOBAL event_scheduler = ON;

CREATE EVENT actualizar_revision_productos
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
    UPDATE productos_accesorios
    SET ultima_revision = CURRENT_TIMESTAMP
    WHERE estado = 'activo';