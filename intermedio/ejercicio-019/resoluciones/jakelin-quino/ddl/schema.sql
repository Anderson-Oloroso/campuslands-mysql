-- Ejercicio 019 - Intermedio - HAVING Paracaidismo
CREATE TABLE `ejercicio-019-int-saltos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    altura INT DEFAULT 0,
    saltos INT DEFAULT 0
);