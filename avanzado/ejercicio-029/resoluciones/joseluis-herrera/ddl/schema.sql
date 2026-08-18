CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP EVENT IF EXISTS ev_registrar_stock_bajo;

DROP TABLE IF EXISTS historial_stock;

DROP TABLE IF EXISTS accesorios;

CREATE TABLE accesorios (
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_precio_positivo
        CHECK (precio > 0),

    CONSTRAINT chk_stock_no_negativo
        CHECK (stock >= 0)
);

CREATE TABLE historial_stock (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_accesorio INT NOT NULL,
    stock_registrado INT NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_historial_accesorio
        FOREIGN KEY (id_accesorio)
        REFERENCES accesorios(id_accesorio)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT chk_stock_registrado_no_negativo
        CHECK (stock_registrado >= 0)
);

CREATE EVENT ev_registrar_stock_bajo
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
    INSERT INTO historial_stock (
        id_accesorio,
        stock_registrado
    )
    SELECT
        id_accesorio,
        stock
    FROM accesorios
    WHERE estado = 'activo'
      AND stock <= 5;