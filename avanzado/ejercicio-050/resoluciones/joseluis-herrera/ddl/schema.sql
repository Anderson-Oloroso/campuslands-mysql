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
    fecha_tatuaje DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chk_precio_tatuaje CHECK (precio > 0),
    CONSTRAINT chk_estado_tatuaje CHECK (estado IN ('agendado', 'completado', 'cancelado'))
);

CREATE INDEX idx_tatuajes_estado
ON tatuajes (estado);

CREATE INDEX idx_tatuajes_fecha
ON tatuajes (fecha_tatuaje);

CREATE INDEX idx_tatuajes_artista_estado
ON tatuajes (nombre_artista, estado);