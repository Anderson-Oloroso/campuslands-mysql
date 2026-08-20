CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS productos_accesorios;

CREATE TABLE productos_accesorios (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    vendedor VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    estado ENUM('activo', 'agotado', 'retirado') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_precio
        CHECK (precio >= 0),

    CONSTRAINT chk_fechas
        CHECK (fecha_actualizacion >= fecha_publicacion)
);