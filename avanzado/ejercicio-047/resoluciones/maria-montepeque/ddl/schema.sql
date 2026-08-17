-- Campuslands MySQL - avanzado ejercicio 047
-- Resolucion: maria-montepeque
-- Tema: tienda de ropa
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_resumen_producto_ropa;
DROP PROCEDURE IF EXISTS sp_top_productos_ropa;
DROP PROCEDURE IF EXISTS sp_registrar_venta_ropa;
DROP TABLE IF EXISTS ventas_avanzado;
DROP TABLE IF EXISTS productos_avanzado;

CREATE TABLE productos_avanzado (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('camisetas','pantalones','vestidos','chaquetas','calzado') NOT NULL,
  precio_unitario DECIMAL(8,2) NOT NULL,
  ingresos_totales DECIMAL(12,2) NOT NULL DEFAULT 0,
  CONSTRAINT chk_productos_avanzado_precio CHECK (precio_unitario > 0),
  CONSTRAINT chk_productos_avanzado_ingresos CHECK (ingresos_totales >= 0)
) ENGINE=InnoDB;

CREATE TABLE ventas_avanzado (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  total_venta DECIMAL(10,2) NOT NULL,
  fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_ventas_avanzado_producto FOREIGN KEY (id_producto) REFERENCES productos_avanzado (id_producto),
  CONSTRAINT chk_ventas_avanzado_cantidad CHECK (cantidad > 0)
) ENGINE=InnoDB;

-- ===================================================================
-- Procedimiento 1: registra una venta y calcula el total segun las
-- reglas de descuento por volumen, sumandolo de forma atomica a los
-- ingresos totales del producto dentro de la misma transaccion.
--
-- Regla de descuento:
--   cantidad >= 5  -> 10% de descuento sobre el total
--   cantidad < 5   -> sin descuento
-- ===================================================================
DELIMITER $$

CREATE PROCEDURE sp_registrar_venta_ropa (
  IN p_id_producto INT,
  IN p_cantidad INT
)
BEGIN
  DECLARE v_precio_unitario DECIMAL(8,2);
  DECLARE v_total DECIMAL(10,2);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  SELECT precio_unitario INTO v_precio_unitario
  FROM productos_avanzado
  WHERE id_producto = p_id_producto;

  IF p_cantidad >= 5 THEN
    SET v_total = (v_precio_unitario * p_cantidad) * 0.90;
  ELSE
    SET v_total = v_precio_unitario * p_cantidad;
  END IF;

  START TRANSACTION;

  INSERT INTO ventas_avanzado (id_producto, cantidad, total_venta)
  VALUES (p_id_producto, p_cantidad, v_total);

  UPDATE productos_avanzado
  SET ingresos_totales = ingresos_totales + v_total
  WHERE id_producto = p_id_producto;

  COMMIT;
END$$

DELIMITER ;

-- ===================================================================
-- Procedimiento 2: ranking de los N productos con mas ingresos.
-- ===================================================================
DELIMITER $$

CREATE PROCEDURE sp_top_productos_ropa (IN p_limite INT)
BEGIN
  SELECT nombre, categoria, ingresos_totales
  FROM productos_avanzado
  ORDER BY ingresos_totales DESC
  LIMIT p_limite;
END$$

DELIMITER ;

-- ===================================================================
-- Procedimiento 3: resumen de un producto especifico (ventas
-- registradas, unidades vendidas e ingresos totales).
-- ===================================================================
DELIMITER $$

CREATE PROCEDURE sp_resumen_producto_ropa (IN p_nombre VARCHAR(120))
BEGIN
  SELECT p.nombre,
         COUNT(v.id_venta) AS ventas_registradas,
         COALESCE(SUM(v.cantidad), 0) AS unidades_vendidas,
         p.ingresos_totales
  FROM productos_avanzado p
  LEFT JOIN ventas_avanzado v ON v.id_producto = p.id_producto
  WHERE p.nombre = p_nombre
  GROUP BY p.nombre, p.ingresos_totales;
END$$

DELIMITER ;
