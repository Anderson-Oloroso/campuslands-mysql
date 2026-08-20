-- Ejercicio 025 - Básico - COUNT y SUM Laboratorio Fórmulas Químicas
CREATE TABLE `ejercicio-025-bas-compuestos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    peso DECIMAL(10,2) DEFAULT 0,
    cantidad INT DEFAULT 0
);