-- DDL: Estructura de catálogo de servicios para Estudio de Tatuajes
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS catalogo_tatuajes;

CREATE TABLE catalogo_tatuajes (
    tatuaje_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_disenio VARCHAR(15) NOT NULL UNIQUE,
    nombre_disenio VARCHAR(100) NOT NULL,
    estilo ENUM('realismo', 'tradicional', 'neotradicional', 'blackwork', 'fine line', 'anime') NOT NULL,
    tamanio_cm VARCHAR(30) NOT NULL,
    precio_estimado DECIMAL(8,2) NOT NULL CHECK (precio_estimado > 0.00),
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_registro DATE NOT NULL
) ENGINE=InnoDB;
