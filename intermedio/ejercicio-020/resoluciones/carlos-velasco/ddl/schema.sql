CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS tatuajes;

CREATE TABLE tatuajes (
    id_tatuaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    nombre_artista VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    duracion_horas DECIMAL(4, 2) NOT NULL,
    fecha_cita DATE NOT NULL,
    estado ENUM('reservado', 'realizado', 'cancelado') NOT NULL DEFAULT 'reservado',

    CONSTRAINT chk_tatuajes_precio
        CHECK (precio > 0),

    CONSTRAINT chk_tatuajes_duracion
        CHECK (duracion_horas > 0)
);