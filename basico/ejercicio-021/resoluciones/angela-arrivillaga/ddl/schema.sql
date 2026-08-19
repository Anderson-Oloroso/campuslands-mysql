CREATE DATABASE IF NOT EXISTS dibujo_digital_db;
USE dibujo_digital_db;

CREATE TABLE obras_dibujo (
    id_obra INT PRIMARY KEY AUTO_INCREMENT,
    codigo_obra VARCHAR(20) NOT NULL UNIQUE,
    titulo_obra VARCHAR(100) NOT NULL,
    software_usado VARCHAR(50) NOT NULL,
    tiempo_horas INT NOT NULL,
    calificacion_artista DECIMAL(3,2) NOT NULL,
    estado_obra ENUM('publicado', 'en_proceso', 'borrador', 'archivado') DEFAULT 'publicado',
    CONSTRAINT chk_tiempo_obra CHECK (tiempo_horas > 0),
    CONSTRAINT chk_calificacion_obra CHECK (calificacion_artista >= 0.00 AND calificacion_artista <= 5.00)
);