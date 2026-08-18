-- Ejercicio 048 - Avanzado - Funciones SQL Viajes y Turismo
CREATE TABLE `ejercicio-048-adv-reservas` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(50) NOT NULL,
    destino VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    precio DECIMAL(10,2) DEFAULT 0
);