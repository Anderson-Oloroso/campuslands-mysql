CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_streaming;

CREATE TABLE equipos_streaming (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado ENUM('disponible', 'agotado', 'descontinuado') NOT NULL DEFAULT 'disponible',
    CONSTRAINT chk_precio_positivo CHECK (precio > 0),
    CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0)
);

CREATE INDEX idx_equipos_categoria
ON equipos_streaming (categoria);

CREATE INDEX idx_equipos_estado
ON equipos_streaming (estado);

CREATE INDEX idx_equipos_stock
ON equipos_streaming (stock);

CREATE INDEX idx_equipos_precio
ON equipos_streaming (precio);

CREATE INDEX idx_equipos_estado_categoria
ON equipos_streaming (estado, categoria);