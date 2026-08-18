CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP VIEW IF EXISTS vw_accesorios_activos;

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

CREATE VIEW vw_accesorios_activos AS
SELECT
    id_accesorio,
    nombre,
    categoria,
    precio,
    stock
FROM accesorios
WHERE estado = 'activo';