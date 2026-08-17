-- DDL: Estructura para la gestión e inserción de registros de paracaidismo
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS registro_saltos_basico;

CREATE TABLE registro_saltos_basico (
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_salto VARCHAR(15) NOT NULL UNIQUE,
    paracaidista_nombre VARCHAR(100) NOT NULL,
    modalidad ENUM('tandem', 'solo', 'freefly', 'formación', 'wing suit') NOT NULL,
    altura_pies INT NOT NULL CHECK (altura_pies >= 3000),
    costo_usd DECIMAL(8,2) NOT NULL CHECK (costo_usd > 0.00),
    estado ENUM('programado', 'completado', 'cancelado') NOT NULL DEFAULT 'programado',
    fecha_salto DATETIME NOT NULL
) ENGINE=InnoDB;
