CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE tatuajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    estilo ENUM('neotradicional', 'realismo', 'minimalista', 'blackwork', 'tradicional') NOT NULL,
    precio DECIMAL(9, 2) NOT NULL,
    horas_trabajo INT NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL,
    estado ENUM('completado', 'en_proceso', 'agendado') DEFAULT 'agendado',
    CONSTRAINT chk_precio_tatuaje CHECK (precio > 0),
    CONSTRAINT chk_horas_tatuaje CHECK (horas_trabajo > 0),
    CONSTRAINT chk_calificacion_tatuaje CHECK (calificacion BETWEEN 0 AND 10)
);