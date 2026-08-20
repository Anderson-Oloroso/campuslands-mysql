CREATE DATABASE IF NOT EXISTS equipo_streaming_db;
USE equipo_streaming_db;

CREATE TABLE marcas_streaming (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nombre_marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    sitio_web VARCHAR(100)
);

CREATE TABLE equipo_streaming (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    codigo_equipo VARCHAR(20) NOT NULL UNIQUE,
    nombre_equipo VARCHAR(100) NOT NULL,
    tipo_equipo VARCHAR(40) NOT NULL,
    id_marca INT NOT NULL,
    precio_usd DECIMAL(10,2) NOT NULL,
    estado_operativo ENUM('activo', 'en_reparacion', 'respuesto', 'retirado') DEFAULT 'activo',
    CONSTRAINT fk_equipo_marca FOREIGN KEY (id_marca) REFERENCES marcas_streaming(id_marca) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_precio_equipo CHECK (precio_usd > 0.00)
);