CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS platos;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE platos (
    id_plato INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    calorias INT NOT NULL,
    estado ENUM('disponible', 'agotado') NOT NULL DEFAULT 'disponible',
    id_categoria INT NOT NULL,
    CONSTRAINT chk_platos_precio CHECK (precio >= 0),
    CONSTRAINT chk_platos_calorias CHECK (calorias > 0),
    CONSTRAINT fk_platos_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);