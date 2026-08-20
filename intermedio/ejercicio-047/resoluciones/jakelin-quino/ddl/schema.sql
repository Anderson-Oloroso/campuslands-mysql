-- Ejercicio 047 - Intermedio - LEFT JOIN Tienda de Ropa
CREATE TABLE `ejercicio-047-int-categorias` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL
);

CREATE TABLE `ejercicio-047-int-productos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    categoria_id INT,
    precio DECIMAL(8,2) DEFAULT 0,
    FOREIGN KEY (categoria_id) REFERENCES `ejercicio-047-int-categorias`(id)
);