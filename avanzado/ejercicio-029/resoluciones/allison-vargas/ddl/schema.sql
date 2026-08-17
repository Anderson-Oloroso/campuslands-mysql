DROP DATABASE IF EXISTS marketplace_accesorios_db;
CREATE DATABASE marketplace_accesorios_db;
USE marketplace_accesorios_db;

-- Habilitar el Programador de Eventos globalmente en el servidor MySQL
SET GLOBAL event_scheduler = ON;

CREATE TABLE productos_accesorios (
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_accesorio VARCHAR(60) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado_oferta VARCHAR(20) NOT NULL,
    fecha_expiracion DATETIME NOT NULL,
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0.00),
    CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0),
    CONSTRAINT chk_estado_oferta CHECK (estado_oferta IN ('Activa', 'Expirada', 'Pendiente'))
);

-- Creación del Event Scheduler para expirar ofertas automáticamente cada hora o según programación
DELIMITER //
CREATE EVENT IF NOT EXISTS evt_expirar_ofertas_vencidas
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    UPDATE productos_accesorios
    SET estado_oferta = 'Expirada'
    WHERE fecha_expiracion <= NOW() AND estado_oferta = 'Activa';
END //
DELIMITER ;
