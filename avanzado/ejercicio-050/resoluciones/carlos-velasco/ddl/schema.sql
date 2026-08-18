CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS tatuajes;

CREATE TABLE tatuajes (
    id_tatuaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    tamano_cm DECIMAL(5,2) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('reservado', 'realizado', 'pendiente') NOT NULL DEFAULT 'pendiente',
    fecha_tatuaje DATE NOT NULL,

    CONSTRAINT chk_tamano_positivo CHECK (tamano_cm > 0),
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0)
);

CREATE INDEX idx_tatuajes_artista
ON tatuajes (artista);

CREATE INDEX idx_tatuajes_estilo
ON tatuajes (estilo);

CREATE INDEX idx_tatuajes_estado
ON tatuajes (estado);

CREATE INDEX idx_tatuajes_fecha
ON tatuajes (fecha_tatuaje);

CREATE INDEX idx_tatuajes_estado_fecha
ON tatuajes (estado, fecha_tatuaje);