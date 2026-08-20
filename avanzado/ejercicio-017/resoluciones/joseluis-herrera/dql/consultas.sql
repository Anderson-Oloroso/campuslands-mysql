USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_listar_productos;
DROP PROCEDURE IF EXISTS sp_buscar_productos_categoria;
DROP PROCEDURE IF EXISTS sp_actualizar_stock;
DROP PROCEDURE IF EXISTS sp_productos_stock_bajo;
DROP PROCEDURE IF EXISTS sp_resumen_categoria;

DELIMITER $$

-- =========================================================
-- 1. Listar todos los productos
-- =========================================================

CREATE PROCEDURE sp_listar_productos()
BEGIN
    SELECT
        p.id_producto,
        p.nombre AS producto,
        c.nombre AS categoria,
        p.talla,
        p.precio,
        p.stock,
        p.disponible,
        p.fecha_ingreso
    FROM productos AS p
    INNER JOIN categorias AS c
        ON p.id_categoria = c.id_categoria
    ORDER BY p.nombre ASC;
END$$


-- =========================================================
-- 2. Buscar productos por categoría
-- =========================================================

CREATE PROCEDURE sp_buscar_productos_categoria(
    IN p_categoria VARCHAR(50)
)
BEGIN
    SELECT
        p.id_producto,
        p.nombre AS producto,
        c.nombre AS categoria,
        p.talla,
        p.precio,
        p.stock
    FROM productos AS p
    INNER JOIN categorias AS c
        ON p.id_categoria = c.id_categoria
    WHERE c.nombre = p_categoria
    ORDER BY p.precio DESC;
END$$


-- =========================================================
-- 3. Actualizar el stock de un producto
-- =========================================================

CREATE PROCEDURE sp_actualizar_stock(
    IN p_id_producto INT,
    IN p_nuevo_stock INT
)
BEGIN
    IF p_nuevo_stock < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    ELSE
        UPDATE productos
        SET
            stock = p_nuevo_stock,
            disponible = p_nuevo_stock > 0
        WHERE id_producto = p_id_producto;
    END IF;
END$$


-- =========================================================
-- 4. Mostrar productos con stock bajo
-- =========================================================

CREATE PROCEDURE sp_productos_stock_bajo(
    IN p_limite_stock INT
)
BEGIN
    SELECT
        p.id_producto,
        p.nombre AS producto,
        c.nombre AS categoria,
        p.stock,
        p.precio
    FROM productos AS p
    INNER JOIN categorias AS c
        ON p.id_categoria = c.id_categoria
    WHERE p.stock <= p_limite_stock
    ORDER BY p.stock ASC;
END$$


-- =========================================================
-- 5. Obtener resumen de una categoría
-- =========================================================

CREATE PROCEDURE sp_resumen_categoria(
    IN p_categoria VARCHAR(50)
)
BEGIN
    SELECT
        c.nombre AS categoria,
        COUNT(p.id_producto) AS total_productos,
        ROUND(AVG(p.precio), 2) AS precio_promedio,
        MIN(p.precio) AS precio_minimo,
        MAX(p.precio) AS precio_maximo,
        SUM(p.stock) AS stock_total
    FROM categorias AS c
    INNER JOIN productos AS p
        ON c.id_categoria = p.id_categoria
    WHERE c.nombre = p_categoria
    GROUP BY c.id_categoria, c.nombre;
END$$

DELIMITER ;


-- =========================================================
-- PRUEBAS DE LOS PROCEDIMIENTOS
-- =========================================================

CALL sp_listar_productos();


CALL sp_buscar_productos_categoria('Camisetas');


CALL sp_actualizar_stock(10, 12);

CALL sp_productos_stock_bajo(5);


CALL sp_resumen_categoria('Pantalones');

SELECT
    id_producto,
    nombre AS producto,
    stock,
    disponible
FROM productos
WHERE id_producto = 10;