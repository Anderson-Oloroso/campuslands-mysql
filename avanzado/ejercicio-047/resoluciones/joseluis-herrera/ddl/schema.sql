CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_buscar_categoria;
DROP PROCEDURE IF EXISTS sp_actualizar_stock;
DROP PROCEDURE IF EXISTS sp_registrar_prenda;

DROP TABLE IF EXISTS prendas;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE prendas (
    id_prenda INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_ingreso DATE NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT chk_prendas_precio CHECK (precio >= 0),
    CONSTRAINT chk_prendas_stock CHECK (stock >= 0),
    CONSTRAINT fk_prendas_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);

DELIMITER $$

CREATE PROCEDURE sp_registrar_prenda(
    IN p_nombre VARCHAR(100),
    IN p_talla VARCHAR(10),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_categoria INT
)
BEGIN
    INSERT INTO prendas(
        nombre,
        talla,
        precio,
        stock,
        disponible,
        fecha_ingreso,
        id_categoria
    )
    VALUES(
        p_nombre,
        p_talla,
        p_precio,
        p_stock,
        TRUE,
        CURDATE(),
        p_categoria
    );
END $$

CREATE PROCEDURE sp_actualizar_stock(
    IN p_id_prenda INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE prendas
    SET stock = p_nuevo_stock,
        disponible = IF(p_nuevo_stock > 0, TRUE, FALSE)
    WHERE id_prenda = p_id_prenda;
END $$

CREATE PROCEDURE sp_buscar_categoria(
    IN p_categoria VARCHAR(50)
)
BEGIN
    SELECT
        p.id_prenda,
        p.nombre,
        c.nombre AS categoria,
        p.talla,
        p.precio,
        p.stock
    FROM prendas p
    INNER JOIN categorias c
        ON p.id_categoria = c.id_categoria
    WHERE c.nombre = p_categoria
    ORDER BY p.precio DESC;
END $$

DELIMITER ;