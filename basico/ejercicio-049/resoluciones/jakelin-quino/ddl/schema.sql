-- Ejercicio 049 - Básico - INSERT Paracaidismo
CREATE TABLE `ejercicio-049-bas-saltos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    altura INT DEFAULT 0,
    saltos INT DEFAULT 0,
    fecha DATE DEFAULT (CURRENT_DATE)
);