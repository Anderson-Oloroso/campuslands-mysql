-- DDL: Estructura Normalizada a 1FN (Atomicidad de atributos y relaciones)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS equipamientos_hiperdeportivos;
DROP TABLE IF EXISTS hiperdeportivos_intermedio;

-- Tabla principal de hiperdeportivos
CREATE TABLE hiperdeportivos_intermedio (
    auto_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    motor VARCHAR(40) NOT NULL,
    precio_usd DECIMAL(12, 2) NOT NULL CHECK (precio_usd > 0.00),
    estado ENUM('disponible', 'reservado', 'vendido') NOT NULL DEFAULT 'disponible'
) ENGINE=InnoDB;

-- Tabla separada para equipamientos/características (Cumplimiento de 1FN - Sin valores repetidos ni listas)
CREATE TABLE equipamientos_hiperdeportivos (
    equipamiento_id INT AUTO_INCREMENT PRIMARY KEY,
    auto_id INT NOT NULL,
    caracteristica VARCHAR(80) NOT NULL,
    categoria ENUM('aerodinamica', 'seguridad', 'rendimiento', 'interior') NOT NULL,
    FOREIGN KEY (auto_id) REFERENCES hiperdeportivos_intermedio(auto_id) ON DELETE CASCADE
) ENGINE=InnoDB;
