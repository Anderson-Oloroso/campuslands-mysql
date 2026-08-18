-- Ejercicio 053 - Intermedio - Normalización 3FN Arquitectura 3D

-- Tabla de países
CREATE TABLE `ejercicio-053-int-paises` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    continente VARCHAR(30) NOT NULL
);

-- Tabla de ciudades (depende de país)
CREATE TABLE `ejercicio-053-int-ciudades` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    pais_id INT,
    poblacion INT DEFAULT 0,
    FOREIGN KEY (pais_id) REFERENCES `ejercicio-053-int-paises`(id)
);

-- Tabla de edificios (depende de ciudad)
CREATE TABLE `ejercicio-053-int-edificios` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    ciudad_id INT,
    altura INT DEFAULT 0,
    costo DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (ciudad_id) REFERENCES `ejercicio-053-int-ciudades`(id)
);