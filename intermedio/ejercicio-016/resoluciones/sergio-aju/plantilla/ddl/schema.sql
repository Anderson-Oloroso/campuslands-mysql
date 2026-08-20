-- Campuslands MySQL - Intermedio Ejercicio 016
-- Restaurante de Comida Urbana (Relación Categorías y Productos)
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso a sus dependencias
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;

-- 1. Tabla de Categorías (Entidad Padre)
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE COMMENT 'Nombre de la categoría (Hamburguesas, Tacos, etc.)',
    descripcion VARCHAR(255) NULL COMMENT 'Breve descripción del concepto de la categoría',
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Tabla de Productos (Entidad Hija)
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    puntaje DECIMAL(3,2) NOT NULL DEFAULT 0.00 COMMENT 'Calificación promedio de clientes (0.00 a 5.00)',
    estado ENUM('activo', 'revision', 'inactivo') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- Restricciones de Clave Foránea e Integridad
    CONSTRAINT fk_productos_categorias 
        FOREIGN KEY (categoria_id) REFERENCES categorias(id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_producto_puntaje CHECK (puntaje BETWEEN 0.00 AND 5.00),
    CONSTRAINT chk_producto_precio CHECK (precio >= 0.00)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;