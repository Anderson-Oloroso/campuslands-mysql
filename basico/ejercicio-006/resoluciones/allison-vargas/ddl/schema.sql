-- DDL: Estructura básica para práctica de filtros WHERE en Autos Hiperdeportivos
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS hiperdeportivos_basico;

CREATE TABLE hiperdeportivos_basico (
    auto_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL CHECK (anio >= 2000),
    caballos_fuerza INT NOT NULL CHECK (caballos_fuerza > 0),
    precio_usd DECIMAL(12, 2) NOT NULL CHECK (precio_usd > 0.00),
    transmision ENUM('automatica', 'secuencial', 'manual') NOT NULL DEFAULT 'secuencial',
    disponible BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;
