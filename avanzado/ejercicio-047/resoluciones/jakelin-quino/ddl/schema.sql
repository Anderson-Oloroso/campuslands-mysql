-- Ejercicio 047 - Avanzado - Procedimientos Tienda de Ropa
CREATE TABLE `ejercicio-047-adv-productos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2) DEFAULT 0,
    stock INT DEFAULT 0
);

CREATE TABLE `ejercicio-047-adv-ventas` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cantidad INT DEFAULT 0,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES `ejercicio-047-adv-productos`(id)
);