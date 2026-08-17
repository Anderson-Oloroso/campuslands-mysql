CREATE DATABASE ejercicio_06;
USE ejercicio_06;

CREATE TABLE fabricantes (
    id_fabricante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE modelos (
    id_modelo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    potencia_hp INT NOT NULL,
    velocidad_max INT NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id_fabricante)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_modelo INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo)
);