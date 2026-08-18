CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS dibujos;

CREATE TABLE dibujos (
    id_dibujo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    tecnica VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    nivel_dificultad VARCHAR(20) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_creacion DATE NOT NULL,
    CONSTRAINT chk_precio_dibujo CHECK (precio > 0),
    CONSTRAINT chk_nivel_dibujo CHECK (
        nivel_dificultad IN ('basico', 'intermedio', 'avanzado')
    ),
    CONSTRAINT chk_estado_dibujo CHECK (
        estado IN ('disponible', 'vendido', 'reservado')
    )
);

CREATE INDEX idx_dibujos_estado_precio
ON dibujos (estado, precio);

CREATE INDEX idx_dibujos_artista_estado
ON dibujos (artista, estado);