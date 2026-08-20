CREATE DATABASE IF NOT EXISTS campuslands_dibujo_digital_avanzado;
USE campuslands_dibujo_digital_avanzado;

DROP TABLE IF EXISTS obras_digitales;

CREATE TABLE obras_digitales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    estilo VARCHAR(80) NOT NULL,
    puntaje_calidad DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    estado ENUM('activo', 'revision', 'inactivo') NOT NULL DEFAULT 'activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_estado (estado),
    INDEX idx_estilo (estilo),
    INDEX idx_puntaje (puntaje_calidad)
);