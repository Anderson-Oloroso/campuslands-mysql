-- Campuslands MySQL - basico ejercicio 016
-- Restaurante de Comida Urbana (Street Food)
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_016;

CREATE TABLE basico_ejercicio_016 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL COMMENT 'Nombre del platillo o combo urbano',
    categoria VARCHAR(80) NOT NULL COMMENT 'Categoría: Hamburguesas, Tacos, Hot Dogs, Entradas, Bebidas',
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Precio unitario en moneda local',
    puntaje DECIMAL(3,2) NOT NULL DEFAULT 0.00 COMMENT 'Calificación promedio de clientes (0.00 a 5.00)',
    estado ENUM('activo', 'revision', 'inactivo') NOT NULL DEFAULT 'activo' COMMENT 'Estado del platillo en el menú',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- Validaciones de integridad de negocio
    CONSTRAINT chk_puntaje_rango CHECK (puntaje BETWEEN 0.00 AND 5.00),
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;