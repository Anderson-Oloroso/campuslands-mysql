-- Ejercicio 055 - Intermedio - UNIQUE Laboratorio Fórmulas Químicas
CREATE TABLE `ejercicio-055-int-compuestos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    formula VARCHAR(20) NOT NULL UNIQUE,
    tipo VARCHAR(30) NOT NULL,
    peso DECIMAL(10,2) DEFAULT 0
);