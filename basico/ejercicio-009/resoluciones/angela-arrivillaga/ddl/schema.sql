CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS peleadores_kickboxing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    categoria_peso VARCHAR(30) NOT NULL,
    peleas_ganadas INT NOT NULL DEFAULT 0,
    peleas_perdidas INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'retirado', 'suspendido') DEFAULT 'activo',
    CONSTRAINT chk_ganadas CHECK (peleas_ganadas >= 0),
    CONSTRAINT chk_perdidas CHECK (peleas_perdidas >= 0)
);