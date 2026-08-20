-- Ejercicio 029 - Intermedio - Vistas Simples Marketplace Accesorios
CREATE TABLE `ejercicio-029-int-productos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    precio DECIMAL(8,2) DEFAULT 0,
    stock INT DEFAULT 0
);