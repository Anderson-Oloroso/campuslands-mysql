CREATE DATABASE IF NOT EXISTS saga_scifi_db;
USE saga_scifi_db;

CREATE TABLE eventos_saga (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    titulo_evento VARCHAR(100) NOT NULL,
    tipo_hito ENUM('Lanzamiento', 'Estreno', 'Exploracion', 'Conflicto', 'Tratado') NOT NULL,
    fecha_evento DATE NOT NULL,
    anio_universo_ficcion INT NOT NULL,
    estado_registro ENUM('activo', 'historico', 'clasificado') DEFAULT 'activo',
    CONSTRAINT chk_anio_ficcion CHECK (anio_universo_ficcion >= 2000)
);