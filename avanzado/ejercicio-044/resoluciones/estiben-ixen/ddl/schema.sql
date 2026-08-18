-- Campuslands MySQL - avanzado ejercicio-044
-- Tema: saga de ciencia ficcion (event scheduler)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_scifi;
DROP TABLE IF EXISTS naves_espaciales;
DROP TABLE IF EXISTS facciones_scifi;

CREATE TABLE facciones_scifi (
    id_faccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_faccion VARCHAR(60) NOT NULL UNIQUE,
    planeta_capital VARCHAR(50) NOT NULL,
    tipo_gobierno ENUM('Imperio','Federacion','Corporacion','Gremio') NOT NULL
);

CREATE TABLE naves_espaciales (
    id_nave INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nave VARCHAR(70) NOT NULL,
    clase ENUM('Caza Ligero','Corbeta','Fragata','Destructor','Crucero de Batalla','Nave Insignia') NOT NULL,
    id_faccion INT NOT NULL,
    tripulacion_max INT NOT NULL,
    velocidad_curvatura DECIMAL(4,2) NOT NULL,
    nivel_escudos INT NOT NULL DEFAULT 100,
    estado_operativo ENUM('Activo','En Mantenimiento','Destruida') DEFAULT 'Activo',
    FOREIGN KEY (id_faccion) REFERENCES facciones_scifi(id_faccion) ON DELETE CASCADE
);

-- Creacion de Event Scheduler
SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS evt_mantenimiento_scifi;
DELIMITER //
CREATE EVENT evt_mantenimiento_scifi
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    -- Registro de auditoria periodico
    INSERT INTO log_auditoria_scifi (accion, tabla_afectada, registro_id, detalles)
    VALUES ('EVENT_MAINTENANCE', 'naves_espaciales', 0, 'Mantenimiento preventivo automatico ejecutado');
END //
DELIMITER ;
