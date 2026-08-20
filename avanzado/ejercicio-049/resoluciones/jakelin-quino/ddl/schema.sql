-- Ejercicio 049 - Avanzado - Triggers Paracaidismo
CREATE TABLE `ejercicio-049-adv-saltos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    altura INT DEFAULT 0,
    saltos INT DEFAULT 0
);

CREATE TABLE `ejercicio-049-adv-log` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mensaje VARCHAR(100) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);