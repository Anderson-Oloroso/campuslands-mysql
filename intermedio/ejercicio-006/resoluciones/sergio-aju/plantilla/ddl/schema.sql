CREATE DATABASE db_hiperdeportivos_1fn;
USE db_hiperdeportivos_1fn;

CREATE TABLE autos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    velocidad INT NOT NULL,
    precio DECIMAL(5,2) NOT NULL
);

CREATE TABLE caracteristicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    auto_id INT NOT NULL,
    detalle VARCHAR(100) NOT NULL,
    FOREIGN KEY (auto_id) REFERENCES autos(id)
);