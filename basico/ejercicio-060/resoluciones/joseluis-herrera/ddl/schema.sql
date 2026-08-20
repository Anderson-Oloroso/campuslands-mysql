CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_streaming;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE equipos_streaming (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    estado ENUM('disponible', 'agotado') NOT NULL DEFAULT 'disponible',
    id_categoria INT NOT NULL,
    CONSTRAINT fk_equipo_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria),
    CONSTRAINT chk_equipo_precio
        CHECK (precio > 0),
    CONSTRAINT chk_equipo_stock
        CHECK (stock >= 0)
);