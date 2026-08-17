-- Campuslands MySQL - avanzado ejercicio 017
-- Resolucion: maria-montepeque
-- Tema: tienda de ropa
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ventas_avanzado;
DROP TABLE IF EXISTS productos_avanzado;

CREATE TABLE productos_avanzado (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('camisa','pantalon','vestido','chaqueta','accesorio') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  CONSTRAINT chk_productos_avanzado_precio CHECK (precio > 0),
  CONSTRAINT chk_productos_avanzado_stock CHECK (stock >= 0)
) ENGINE=InnoDB;

CREATE TABLE ventas_avanzado (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_ventas_avanzado_producto FOREIGN KEY (id_producto) REFERENCES productos_avanzado (id_producto),
  CONSTRAINT chk_ventas_avanzado_cantidad CHECK (cantidad > 0)
) ENGINE=InnoDB;

-- ===================================================================
-- Procedimiento 1: registrar una venta de forma atomica.
-- Valida que el producto exista y que haya stock suficiente antes de
-- insertar la venta y descontar el inventario. Si algo falla, revierte
-- todo con ROLLBACK y propaga el error con RESIGNAL.
-- ===================================================================
DROP PROCEDURE IF EXISTS sp_registrar_venta;

DELIMITER $$

CREATE PROCEDURE sp_registrar_venta (
  IN p_id_producto INT,
  IN p_cantidad INT
)
BEGIN
  DECLARE v_stock INT;
  DECLARE v_precio DECIMAL(10,2);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  SELECT stock, precio INTO v_stock, v_precio
  FROM productos_avanzado
  WHERE id_producto = p_id_producto
  FOR UPDATE;

  IF v_stock IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe';
  ELSEIF v_stock < p_cantidad THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para completar la venta';
  END IF;

  INSERT INTO ventas_avanzado (id_producto, cantidad, total)
  VALUES (p_id_producto, p_cantidad, v_precio * p_cantidad);

  UPDATE productos_avanzado
  SET stock = stock - p_cantidad
  WHERE id_producto = p_id_producto;

  COMMIT;
END$$

DELIMITER ;

-- ===================================================================
-- Procedimiento 2: listar productos en o por debajo de un umbral de
-- stock, para decidir reabastecimiento.
-- ===================================================================
DROP PROCEDURE IF EXISTS sp_productos_bajo_stock;

DELIMITER $$

CREATE PROCEDURE sp_productos_bajo_stock (IN p_umbral INT)
BEGIN
  SELECT nombre, categoria, stock
  FROM productos_avanzado
  WHERE stock <= p_umbral
  ORDER BY stock ASC;
END$$

DELIMITER ;

-- ===================================================================
-- Procedimiento 3: resumen general de ventas (numero de ventas,
-- unidades vendidas e ingresos totales).
-- ===================================================================
DROP PROCEDURE IF EXISTS sp_resumen_ventas;

DELIMITER $$

CREATE PROCEDURE sp_resumen_ventas ()
BEGIN
  SELECT COUNT(*) AS total_ventas,
         SUM(cantidad) AS unidades_vendidas,
         SUM(total) AS ingresos_totales
  FROM ventas_avanzado;
END$$

DELIMITER ;
