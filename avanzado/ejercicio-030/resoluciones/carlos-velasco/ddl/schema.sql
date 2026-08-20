CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS transmisiones;

CREATE TABLE transmisiones (
    id_transmision INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_streamer VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    espectadores INT UNSIGNED NOT NULL,
    duracion_minutos INT UNSIGNED NOT NULL,
    fecha_transmision DATETIME NOT NULL,
    estado ENUM('activa', 'finalizada', 'cancelada') NOT NULL DEFAULT 'finalizada',

    CONSTRAINT chk_espectadores
        CHECK (espectadores >= 0),

    CONSTRAINT chk_duracion
        CHECK (duracion_minutos > 0),

    INDEX idx_plataforma (plataforma),
    INDEX idx_categoria (categoria),
    INDEX idx_fecha_transmision (fecha_transmision),
    INDEX idx_estado (estado),
    INDEX idx_categoria_espectadores (categoria, espectadores)
);