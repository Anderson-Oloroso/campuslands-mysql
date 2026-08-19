CREATE DATABASE IF NOT EXISTS estudio_tatuajes_db;
USE estudio_tatuajes_db;

CREATE TABLE estilos_tatuaje (
    id_estilo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estilo VARCHAR(50) NOT NULL UNIQUE,
    descripcion_estilo VARCHAR(150)
);

CREATE TABLE tatuajes_studio (
    id_tatuaje INT PRIMARY KEY AUTO_INCREMENT,
    codigo_tatuaje VARCHAR(20) NOT NULL UNIQUE,
    nombre_diseno VARCHAR(100) NOT NULL,
    id_estilo INT,
    precio_estimado DECIMAL(8,2) NOT NULL,
    tiempo_horas INT NOT NULL,
    estado_diseno ENUM('disponible', 'reservado', 'completado', 'archivado') DEFAULT 'disponible',
    FOREIGN KEY (id_estilo) REFERENCES estilos_tatuaje(id_estilo),
    CONSTRAINT chk_precio_tatuaje CHECK (precio_estimado > 0.00),
    CONSTRAINT chk_tiempo_horas CHECK (tiempo_horas > 0)
);