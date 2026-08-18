CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

CREATE TABLE videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    plataforma VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    estado ENUM('disponible', 'prestado', 'mantenimiento') NOT NULL DEFAULT 'disponible',
    id_categoria INT NOT NULL,

    CONSTRAINT chk_videojuegos_precio
        CHECK (precio >= 0),

    CONSTRAINT fk_videojuegos_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    INDEX idx_videojuegos_estado (estado),
    INDEX idx_videojuegos_plataforma (plataforma),
    INDEX idx_videojuegos_categoria (id_categoria),
    INDEX idx_videojuegos_estado_categoria (estado, id_categoria),
    INDEX idx_videojuegos_precio (precio)
);