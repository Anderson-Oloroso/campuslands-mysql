-- Campuslands MySQL - Avanzado Ejercicio 059
-- Event Scheduler para Marketplace de Accesorios

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Habilitar el programador de eventos global
SET GLOBAL event_scheduler = ON;

-- Limpieza preventiva
DROP EVENT IF EXISTS evt_desactivar_promociones_vencidas;
DROP EVENT IF EXISTS evt_limpiar_carritos_abandonados;
DROP EVENT IF EXISTS evt_resumen_diario_ventas;

DROP TABLE IF EXISTS auditoria_eventos;
DROP TABLE IF EXISTS historico_ventas_diarias;
DROP TABLE IF EXISTS detalle_pedidos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS carritos_compras;
DROP TABLE IF EXISTS productos_accesorios;

-- 1. Tabla: Catálogo de Productos y Accesorios
CREATE TABLE productos_accesorios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('Relojes', 'Joyería', 'Lentes', 'Mochilas', 'Fundas') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    en_promocion TINYINT(1) NOT NULL DEFAULT 0,
    descuento_porcentaje DECIMAL(5,2) DEFAULT 0.00,
    fecha_fin_promocion DATETIME NULL,
    CONSTRAINT chk_precio CHECK (precio >= 0),
    CONSTRAINT chk_stock CHECK (stock >= 0)
) ENGINE=InnoDB;

-- 2. Tabla: Carritos de Compra
CREATE TABLE carritos_compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    estado ENUM('Activo', 'Comprado', 'Abandonado') NOT NULL DEFAULT 'Activo',
    ultima_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES productos_accesorios(id) ON DELETE CASCADE,
    CONSTRAINT chk_cantidad CHECK (cantidad > 0)
) ENGINE=InnoDB;

-- 3. Tabla: Pedidos Realizados
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado ENUM('Pendiente', 'Completado', 'Cancelado') NOT NULL DEFAULT 'Completado',
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_total CHECK (total >= 0)
) ENGINE=InnoDB;

-- 4. Tabla: Registro de Auditoría de Eventos
CREATE TABLE auditoria_eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(100) NOT NULL,
    filas_afectadas INT NOT NULL,
    detalles TEXT NULL,
    ejecutado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 5. Tabla: Histórico de Ventas Diarias (Alimentada por Evento)
CREATE TABLE historico_ventas_diarias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE UNIQUE NOT NULL,
    total_pedidos INT NOT NULL,
    monto_total DECIMAL(12,2) NOT NULL,
    registrado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =================================================================
-- DEFINICIÓN DE EVENTOS (EVENT SCHEDULER)
-- =================================================================

-- Evento 1: Desactivar promociones vencidas cada hora
DELIMITER //
CREATE EVENT evt_desactivar_promociones_vencidas
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    DECLARE filas_promos INT;
    
    UPDATE productos_accesorios 
    SET en_promocion = 0, descuento_porcentaje = 0.00 
    WHERE fecha_fin_promocion IS NOT NULL 
      AND fecha_fin_promocion <= NOW() 
      AND en_promocion = 1;
      
    SET filas_promos = ROW_COUNT();
    
    INSERT INTO auditoria_eventos (nombre_evento, filas_afectadas, detalles)
    VALUES ('evt_desactivar_promociones_vencidas', filas_promos, 'Desactivación automática de ofertas vencidas');
END //
DELIMITER ;

-- Evento 2: Marcar carritos inactivos como 'Abandonado' cada 15 minutos
DELIMITER //
CREATE EVENT evt_limpiar_carritos_abandonados
ON SCHEDULE EVERY 15 MINUTE
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    DECLARE filas_carritos INT;
    
    UPDATE carritos_compras 
    SET estado = 'Abandonado' 
    WHERE estado = 'Activo' 
      AND ultima_actualizacion < DATE_SUB(NOW(), INTERVAL 24 HOUR);
      
    SET filas_carritos = ROW_COUNT();
    
    INSERT INTO auditoria_eventos (nombre_evento, filas_afectadas, detalles)
    VALUES ('evt_limpiar_carritos_abandonados', filas_carritos, 'Identificación de carritos abandonados tras 24 horas');
END //
DELIMITER ;

-- Evento 3: Generar el cierre/resumen diario de ventas cada noche a las 23:59:00
DELIMITER //
CREATE EVENT evt_resumen_diario_ventas
ON SCHEDULE EVERY 1 DAY
STARTS (CURRENT_DATE + INTERVAL 1 DAY - INTERVAL 1 MINUTE)
DO
BEGIN
    INSERT INTO historico_ventas_diarias (fecha, total_pedidos, monto_total)
    SELECT 
        DATE(fecha_pedido) AS fecha,
        COUNT(id) AS total_pedidos,
        SUM(total) AS monto_total
    FROM pedidos
    WHERE DATE(fecha_pedido) = CURRENT_DATE AND estado = 'Completado'
    GROUP BY DATE(fecha_pedido)
    ON DUPLICATE KEY UPDATE 
        total_pedidos = VALUES(total_pedidos),
        monto_total = VALUES(monto_total);
        
    INSERT INTO auditoria_eventos (nombre_evento, filas_afectadas, detalles)
    VALUES ('evt_resumen_diario_ventas', ROW_COUNT(), 'Generación automática de balance diario de ventas');
END //
DELIMITER ;