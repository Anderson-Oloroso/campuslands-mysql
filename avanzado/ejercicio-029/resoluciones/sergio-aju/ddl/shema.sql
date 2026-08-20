CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Habilitar el Event Scheduler globalmente en el servidor MySQL
SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS evt_expirar_pedidos_pendientes;
DROP TABLE IF EXISTS pedidos_marketplace_avanzado;

-- Tabla principal de pedidos con marcas de tiempo (DATETIME) para control de caducidad
CREATE TABLE pedidos_marketplace_avanzado (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_pedido VARCHAR(50) NOT NULL UNIQUE,
  cliente VARCHAR(100) NOT NULL,
  accesorio VARCHAR(100) NOT NULL,
  categoria VARCHAR(60) NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  cantidad INT NOT NULL DEFAULT 1,
  fecha_creacion DATETIME NOT NULL,
  estado_pedido ENUM('pendiente', 'enviado', 'entregado', 'caducado', 'cancelado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_precio_avanzado CHECK (precio_unitario > 0.00),
  CONSTRAINT chk_cantidad_avanzada CHECK (cantidad > 0)
);

-- Creación del Event Scheduler para automatizar la expiración de pedidos pendientes con más de 48 horas de antigüedad
DELIMITER //

CREATE EVENT evt_expirar_pedidos_pendientes
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE pedidos_marketplace_avanzado
    SET estado_pedido = 'caducado'
    WHERE estado_pedido = 'pendiente'
      AND fecha_creacion <= DATE_SUB(NOW(), INTERVAL 48 HOUR);
END //

DELIMITER ;