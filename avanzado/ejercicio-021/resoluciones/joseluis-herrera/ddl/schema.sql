CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS ilustraciones;

CREATE TABLE ilustraciones (
    id_ilustracion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    tecnica VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    software VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('borrador', 'publicada', 'archivada') NOT NULL DEFAULT 'borrador',
    fecha_creacion DATE NOT NULL,

    CONSTRAINT chk_ilustracion_precio
        CHECK (precio >= 0),

    INDEX idx_ilustraciones_artista (artista),
    INDEX idx_ilustraciones_tecnica (tecnica),
    INDEX idx_ilustraciones_categoria (categoria),
    INDEX idx_ilustraciones_estado (estado),
    INDEX idx_ilustraciones_fecha (fecha_creacion)
);