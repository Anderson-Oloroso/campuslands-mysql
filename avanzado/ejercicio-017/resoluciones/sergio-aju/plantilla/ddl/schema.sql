-- Campuslands MySQL - Avanzado Ejercicio 017
-- Tienda de Ropa con Procedimientos Almacenados
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;

-- Tabla de Categorías
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

-- Tabla de Productos de Ropa
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    talla ENUM('XS', 'S', 'M', 'L', 'XL') NOT NULL DEFAULT 'M',
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    stock INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- ==========================================
-- PROCEDIMIENTOS ALMACENADOS
-- ==========================================

-- 1. Procedimiento para registrar o insertar un nuevo producto de ropa
DELIMITER //
CREATE PROCEDURE sp_insertar_producto(
    IN p_categoria_id INT,
    IN p_nombre VARCHAR(120),
    IN p_talla ENUM('XS', 'S', 'M', 'L', 'XL'),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO productos (categoria_id, nombre, talla, precio, stock, estado)
    VALUES (p_categoria_id, p_nombre, p_talla, p_precio, p_stock, 'activo');
END //
DELIMITER ;

-- 2. Procedimiento para actualizar el stock de una prenda
DELIMITER //
CREATE PROCEDURE sp_actualizar_stock(
    IN p_producto_id INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE productos
    SET stock = p_nuevo_stock
    WHERE id = p_producto_id;
END //
DELIMITER ;

-- 3. Procedimiento para consultar productos por categoría y precio máximo
DELIMITER //
CREATE PROCEDURE sp_filtrar_productos(
    IN p_categoria_id INT,
    IN p_precio_max DECIMAL(10,2)
)
BEGIN
    SELECT 
        p.id,
        p.nombre AS producto,
        c.nombre AS categoria,
        p.talla,
        p.precio,
        p.stock
    FROM productos p
    INNER JOIN categorias c ON p.categoria_id = c.id
    WHERE p.categoria_id = p_categoria_id 
      AND p.precio <= p_precio_max 
      AND p.estado = 'activo';
END //
DELIMITER ;