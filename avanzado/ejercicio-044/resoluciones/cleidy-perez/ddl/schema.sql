-- Campuslands MySQL - avanzado ejercicio 014
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET GLOBAL event_scheduler = ON;

CREATE TABLE Sagas (
    saga_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_saga VARCHAR(100) NOT NULL UNIQUE,
    estatus VARCHAR(20) NOT NULL DEFAULT 'Activa'
);

CREATE TABLE BitacoraMantenimiento (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    saga_id INT NOT NULL,
    accion VARCHAR(100) NOT NULL,
    fecha_ejecucion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (saga_id) REFERENCES Sagas(saga_id) ON DELETE CASCADE
);