-- Campuslands MySQL - avanzado ejercicio-034
-- Tema: garaje de motos (triggers)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_garaje_motos;
DROP TABLE IF EXISTS estacionamiento_motos;
DROP TABLE IF EXISTS propietarios_motos;

CREATE TABLE propietarios_motos (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    estado ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE estacionamiento_motos (
    id_estacionamiento INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    espacio_parqueo VARCHAR(15) NOT NULL UNIQUE,
    id_propietario INT NOT NULL,
    costo_hora DECIMAL(6,2) NOT NULL DEFAULT 5.00,
    fecha_ingreso DATETIME NOT NULL,
    estado ENUM('Activo','Completado','Cancelado') DEFAULT 'Activo',
    FOREIGN KEY (id_propietario) REFERENCES propietarios_motos(id_propietario) ON DELETE CASCADE
);

-- Tabla de Auditoria para Triggers
CREATE TABLE log_auditoria_garaje_motos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50) NOT NULL,
    tabla_afectada VARCHAR(50) NOT NULL,
    registro_id INT NOT NULL,
    detalles TEXT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Trigger AFTER INSERT
DROP TRIGGER IF EXISTS trg_despues_insertar_garaje_motos;
DELIMITER //
CREATE TRIGGER trg_despues_insertar_garaje_motos
AFTER INSERT ON estacionamiento_motos
FOR EACH ROW
BEGIN
    INSERT INTO log_auditoria_garaje_motos (accion, tabla_afectada, registro_id, detalles)
    VALUES ('INSERT', 'estacionamiento_motos', NEW.id_estacionamiento, CONCAT('Se creo el registro: ', NEW.placa));
END //
DELIMITER ;
