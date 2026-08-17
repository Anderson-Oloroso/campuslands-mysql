-- DDL: Tabla de autos hiperdeportivos optimizada con índices para análisis con EXPLAIN
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS hiperdeportivos_avanzado;

CREATE TABLE hiperdeportivos_avanzado (
    auto_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio_fabricacion INT NOT NULL CHECK (anio_fabricacion >= 2000),
    velocidad_maxima_kmh INT NOT NULL CHECK (velocidad_maxima_kmh > 0),
    precio_usd DECIMAL(12, 2) NOT NULL CHECK (precio_usd > 0.00),
    estado ENUM('disponible', 'reservado', 'vendido', 'exhibicion') NOT NULL DEFAULT 'disponible',
    
    -- Índices para evaluar con EXPLAIN
    INDEX idx_marca (marca),
    INDEX idx_estado_precio (estado, precio_usd)
) ENGINE=InnoDB;
