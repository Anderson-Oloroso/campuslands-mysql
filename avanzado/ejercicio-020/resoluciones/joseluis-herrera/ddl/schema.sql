CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS tatuajes;

CREATE TABLE tatuajes (
    id_tatuaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    telefono_cliente VARCHAR(20) NOT NULL,
    nombre_tatuador VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('pendiente', 'realizado', 'cancelado') NOT NULL DEFAULT 'pendiente',
    fecha_cita DATE NOT NULL,

    CONSTRAINT chk_tatuaje_precio
        CHECK (precio > 0),

    INDEX idx_tatuajes_tatuador (nombre_tatuador),
    INDEX idx_tatuajes_estilo (estilo),
    INDEX idx_tatuajes_estado (estado),
    INDEX idx_tatuajes_fecha (fecha_cita)
);