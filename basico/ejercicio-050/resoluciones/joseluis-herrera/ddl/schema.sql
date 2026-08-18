CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS tatuajes;

CREATE TABLE tatuajes (
    id_tatuaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    nombre_artista VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    tamano_cm DECIMAL(5,2) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    fecha_cita DATE NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'agendado',
    CONSTRAINT chk_tamano
        CHECK (tamano_cm > 0),
    CONSTRAINT chk_precio
        CHECK (precio >= 0),
    CONSTRAINT chk_estado
        CHECK (estado IN ('agendado', 'completado', 'cancelado'))
);