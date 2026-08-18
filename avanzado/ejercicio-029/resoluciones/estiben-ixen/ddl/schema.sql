-- Campuslands MySQL - avanzado ejercicio-029
-- Tema: marketplace de accesorios (event scheduler)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_marketplace;
DROP TABLE IF EXISTS productos_accesorios;
DROP TABLE IF EXISTS vendedores_marketplace;

CREATE TABLE vendedores_marketplace (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tienda VARCHAR(60) NOT NULL UNIQUE,
    reputacion_estrellas DECIMAL(3,2) NOT NULL DEFAULT 5.00,
    ventas_totales INT NOT NULL DEFAULT 0
);

CREATE TABLE productos_accesorios (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(80) NOT NULL,
    id_vendedor INT NOT NULL,
    categoria ENUM('Audio','Teclados y Mouses','Cables y Hubs','Soportes y Ergonomia','Iluminacion RGB','Mochilas y Fundas') NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    es_envio_gratis ENUM('Si','No') DEFAULT 'Si',
    valoracion_promedio DECIMAL(3,2) NOT NULL DEFAULT 4.50,
    FOREIGN KEY (id_vendedor) REFERENCES vendedores_marketplace(id_vendedor) ON DELETE CASCADE
);

-- Creacion de Event Scheduler
SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS evt_mantenimiento_marketplace;
DELIMITER //
CREATE EVENT evt_mantenimiento_marketplace
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    -- Registro de auditoria periodico
    INSERT INTO log_auditoria_marketplace (accion, tabla_afectada, registro_id, detalles)
    VALUES ('EVENT_MAINTENANCE', 'productos_accesorios', 0, 'Mantenimiento preventivo automatico ejecutado');
END //
DELIMITER ;
