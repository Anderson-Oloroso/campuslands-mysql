-- ============================================================
-- EJERCICIO 017 - TIPOS DE DATOS PARA TIENDA DE ROPA
-- Archivo: ddl/schema.sql
-- Motor: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ============================================================
-- Tabla principal: productos
-- ============================================================

CREATE TABLE productos (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    cantidad_stock SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('disponible', 'agotado') NOT NULL DEFAULT 'disponible',
    fecha_registro DATE NOT NULL,

    CONSTRAINT uq_productos_nombre_talla
        UNIQUE (nombre, talla),

    CONSTRAINT chk_productos_precio
        CHECK (precio > 0),

    CONSTRAINT chk_productos_stock
        CHECK (cantidad_stock >= 0)
);