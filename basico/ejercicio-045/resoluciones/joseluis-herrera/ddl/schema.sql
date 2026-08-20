CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    puntaje DECIMAL(4,2) NOT NULL,
    estado ENUM('disponible', 'prestado') NOT NULL DEFAULT 'disponible',
    id_categoria INT NOT NULL,
    CONSTRAINT chk_videojuegos_precio CHECK (precio >= 0),
    CONSTRAINT chk_videojuegos_puntaje CHECK (puntaje BETWEEN 0 AND 10),
    CONSTRAINT fk_videojuegos_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);