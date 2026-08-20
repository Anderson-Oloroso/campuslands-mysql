-- Ejercicio 019 - Básico - INSERT Paracaidismo
CREATE TABLE `ejercicio-019-bas-saltos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    altura INT DEFAULT 0,
    saltos INT DEFAULT 0,
    fecha DATE DEFAULT (CURRENT_DATE)
);