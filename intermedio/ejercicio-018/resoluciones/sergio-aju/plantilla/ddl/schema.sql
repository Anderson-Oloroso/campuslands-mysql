-- Campuslands MySQL - Intermedio Ejercicio 018
-- Temática: Viajes y Turismo (Uso de GROUP BY)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS paquetes_turisticos;

CREATE TABLE paquetes_turisticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    duracion_dias INT NOT NULL DEFAULT 1,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    puntaje DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);