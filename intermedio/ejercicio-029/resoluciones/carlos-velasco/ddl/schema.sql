CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP VIEW IF EXISTS vista_accesorios_disponibles;
DROP TABLE IF EXISTS accesorios;

CREATE TABLE accesorios (
    id_accesorio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_accesorios_precio
        CHECK (precio > 0),

    CONSTRAINT chk_accesorios_stock
        CHECK (stock >= 0)
);

CREATE VIEW vista_accesorios_disponibles AS
SELECT
    id_accesorio,
    nombre,
    categoria,
    precio,
    stock
FROM accesorios
WHERE estado = 'activo'
  AND stock > 0;