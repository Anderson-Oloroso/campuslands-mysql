-- Ejercicio 046 - Básico - CREATE TABLE Restaurante Comida Urbana
CREATE TABLE `ejercicio-046-bas-platos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) DEFAULT 'rapida',
    precio DECIMAL(6,2) DEFAULT 0,
    tiempo_prep INT DEFAULT 10,
    disponible BOOLEAN DEFAULT TRUE
);