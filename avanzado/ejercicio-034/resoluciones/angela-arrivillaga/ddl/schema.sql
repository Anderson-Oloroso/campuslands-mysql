CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminación previa de objetos si existen para permitir re-ejecución limpia
DROP TRIGGER IF EXISTS trg_auditoria_mantenimiento_motos;
DROP TABLE IF EXISTS auditoria_motos;
DROP TABLE IF EXISTS motos_garaje;

CREATE TABLE motos_garaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    cilindrada INT NOT NULL,
    precio_comercial DECIMAL(10, 2) NOT NULL,
    estado ENUM('disponible', 'en_mantenimiento', 'vendida') DEFAULT 'disponible',
    CONSTRAINT chk_cilindrada CHECK (cilindrada > 0),
    CONSTRAINT chk_precio_moto CHECK (precio_comercial > 0)
);

CREATE TABLE auditoria_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    detalle VARCHAR(255) NOT NULL,
    fecha_evento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creación de un Trigger avanzado en MySQL para auditar cambios automáticos de estado o actualizaciones críticas
DELIMITER //

CREATE TRIGGER trg_auditoria_mantenimiento_motos
AFTER UPDATE ON motos_garaje
FOR EACH ROW
BEGIN
    IF OLD.estado != NEW.estado THEN
        INSERT INTO auditoria_motos (moto_id, accion, detalle)
        VALUES (NEW.id, 'CAMBIO_ESTADO', CONCAT('Estado modificado de: ', OLD.estado, ' a: ', NEW.estado));
    END IF;
END //

DELIMITER ;