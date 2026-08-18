-- Ejercicio 055 - Avanzado - Backup Lógico Laboratorio Fórmulas Químicas
CREATE TABLE `ejercicio-055-adv-compuestos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    formula VARCHAR(20) NOT NULL,
    peso DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE `ejercicio-055-adv-backup` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    registros INT DEFAULT 0
);