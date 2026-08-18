-- Ejercicio 053 - Básico - UPDATE Arquitectura 3D
CREATE TABLE `ejercicio-053-bas-edificios` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    altura INT DEFAULT 0,
    costo DECIMAL(12,2) DEFAULT 0
);