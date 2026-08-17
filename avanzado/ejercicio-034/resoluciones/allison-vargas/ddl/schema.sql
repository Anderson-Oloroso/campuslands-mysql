DROP DATABASE IF EXISTS garaje_motos_db;
CREATE DATABASE garaje_motos_db;
USE garaje_motos_db;

CREATE TABLE motos_garaje (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada_cc INT NOT NULL,
    costo_mantenimiento DECIMAL(10, 2) NOT NULL,
    estado_operativo VARCHAR(20) NOT NULL,
    CONSTRAINT chk_cilindrada CHECK (cilindrada_cc > 0),
    CONSTRAINT chk_costo_mantenimiento CHECK (costo_mantenimiento >= 0.00),
    CONSTRAINT chk_estado_moto CHECK (estado_operativo IN ('Disponible', 'En Reparación', 'Fuera de Servicio'))
);

CREATE TABLE bitacora_motos (
    id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    detalles VARCHAR(255) NOT NULL,
    fecha_registro DATETIME NOT NULL
);

-- Trigger: BEFORE INSERT para validar o normalizar datos antes de registrar la moto
DELIMITER //
CREATE TRIGGER trg_antes_insertar_moto
BEFORE INSERT ON motos_garaje
FOR EACH ROW
BEGIN
    -- Asegurar que si el costo es nulo se ajuste a 0.00
    IF NEW.costo_mantenimiento IS NULL THEN
        SET NEW.costo_mantenimiento = 0.00;
    END IF;
END //
DELIMITER ;

-- Trigger: AFTER UPDATE para registrar cambios en la bitácora de auditoría automáticamente
DELIMITER //
CREATE TRIGGER trg_despues_actualizar_moto
AFTER UPDATE ON motos_garaje
FOR EACH ROW
BEGIN
    IF OLD.estado_operativo != NEW.estado_operativo THEN
        INSERT INTO bitacora_motos (id_moto, accion, detalles, fecha_registro)
        VALUES (
            NEW.id_moto, 
            'CAMBIO_ESTADO', 
            CONCAT('Estado cambiado de: ', OLD.estado_operativo, ' a: ', NEW.estado_operativo), 
            NOW()
        );
    END IF;
END //
DELIMITER ;
