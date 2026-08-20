CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE productos_ropa (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    fecha_ingreso DATE NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CHECK (precio >= 0),
    CHECK (stock >= 0)
);

DELIMITER //

CREATE PROCEDURE sp_productos_por_categoria(
    IN p_categoria VARCHAR(50)
)
BEGIN
    SELECT
        id_producto,
        nombre,
        categoria,
        talla,
        color,
        precio,
        stock,
        disponible
    FROM productos_ropa
    WHERE categoria = p_categoria
    ORDER BY precio DESC;
END //

CREATE PROCEDURE sp_actualizar_stock(
    IN p_id_producto INT,
    IN p_nuevo_stock INT
)
BEGIN
    IF p_nuevo_stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    ELSE
        UPDATE productos_ropa
        SET
            stock = p_nuevo_stock,
            disponible = p_nuevo_stock > 0
        WHERE id_producto = p_id_producto;
    END IF;
END //

DELIMITER ;