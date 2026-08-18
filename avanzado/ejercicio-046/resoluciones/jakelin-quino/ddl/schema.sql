-- Ejercicio 046 - Avanzado - Transacciones Restaurante Comida Urbana
CREATE TABLE `ejercicio-046-adv-inventario` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto VARCHAR(50) NOT NULL,
    cantidad INT DEFAULT 0
);

CREATE TABLE `ejercicio-046-adv-ventas` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto VARCHAR(50) NOT NULL,
    cantidad INT DEFAULT 0,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);