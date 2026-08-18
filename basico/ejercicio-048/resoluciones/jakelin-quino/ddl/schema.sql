-- Ejercicio 048 - Básico - PRIMARY KEY Viajes y Turismo
CREATE TABLE `ejercicio-048-bas-destinos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) DEFAULT 0,
    dias INT DEFAULT 5
);