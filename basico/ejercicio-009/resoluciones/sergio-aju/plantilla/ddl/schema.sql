DROP DATABASE IF EXISTS db_kickboxing;
CREATE DATABASE db_kickboxing;
USE db_kickboxing;

CREATE TABLE peleadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    victorias INT DEFAULT 0,
    derrotas INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'Activo'
);