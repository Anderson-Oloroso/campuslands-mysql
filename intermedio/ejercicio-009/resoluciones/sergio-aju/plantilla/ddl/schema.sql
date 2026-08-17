CREATE DATABASE IF NOT EXISTS academia_kickboxing; 
USE academia_kickboxing;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, peso_limite_kg DECIMAL(5,2)
);

CREATE TABLE luchadores (
    id_luchador INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(100), victorias INT DEFAULT 0, 
    estado VARCHAR(20) DEFAULT 'activo', id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);