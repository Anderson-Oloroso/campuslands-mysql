-- Campuslands MySQL - Avanzado Ejercicio 019
-- Temática: Paracaidismo (Uso de Triggers y Auditoría)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS auditoria_saltos;
DROP TABLE IF EXISTS saltos_paracaidismo;

CREATE TABLE saltos_paracaidismo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modalidad VARCHAR(80) NOT NULL,
    nivel_experiencia ENUM('Principiante', 'Intermedio', 'Avanzado') NOT NULL DEFAULT 'Principiante',
    altura_pies INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    calificacion DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

-- Tabla para auditar los cambios de precio y estado de los saltos
CREATE TABLE auditoria_saltos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salto_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    estado_anterior VARCHAR(20),
    estado_nuevo VARCHAR(20),
    fecha_modificacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (salto_id) REFERENCES saltos_paracaidismo(id) ON DELETE CASCADE
);

-- ==========================================
-- TRIGGERS (DISPARADORES)
-- ==========================================

-- 1. Trigger BEFORE INSERT para validar que la altura mínima sea de 8000 pies
DELIMITER //
CREATE TRIGGER trg_validar_altura_salto
BEFORE INSERT ON saltos_paracaidismo
FOR EACH ROW
BEGIN
    IF NEW.altura_pies < 8000 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La altura mínima de seguridad para un salto debe ser de 8000 pies.';
    END IF;
END //
DELIMITER ;

-- 2. Trigger AFTER UPDATE para registrar cambios de precio o estado en la tabla de auditoría
DELIMITER //
CREATE TRIGGER trg_auditar_cambio_salto
AFTER UPDATE ON saltos_paracaidismo
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio OR OLD.estado <> NEW.estado THEN
        INSERT INTO auditoria_saltos (
            salto_id, 
            accion, 
            precio_anterior, 
            precio_nuevo, 
            estado_anterior, 
            estado_nuevo
        ) VALUES (
            NEW.id, 
            'ACTUALIZACION', 
            OLD.precio, 
            NEW.precio, 
            OLD.estado, 
            NEW.estado
        );
    END IF;
END //
DELIMITER ;