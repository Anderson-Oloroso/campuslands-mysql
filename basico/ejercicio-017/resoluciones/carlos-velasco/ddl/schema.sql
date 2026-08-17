CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS prendas;

CREATE TABLE prendas (
    id_prenda INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    fecha_ingreso DATE NOT NULL,
    estado ENUM('activo', 'agotado', 'descontinuado') NOT NULL DEFAULT 'activo',
    disponible BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT chk_prendas_precio
        CHECK (precio > 0),

    CONSTRAINT chk_prendas_stock
        CHECK (stock >= 0)
);