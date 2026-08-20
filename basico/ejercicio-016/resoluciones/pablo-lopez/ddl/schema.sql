-- ============================================================
-- EJERCICIO 016 - CREATE TABLE PARA RESTAURANTE DE COMIDA URBANA
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
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('disponible', 'no_disponible') NOT NULL DEFAULT 'disponible',
    fecha_alta DATE NOT NULL,

    CONSTRAINT chk_productos_precio
        CHECK (precio > 0),

    CONSTRAINT uq_productos_nombre
        UNIQUE (nombre)
);