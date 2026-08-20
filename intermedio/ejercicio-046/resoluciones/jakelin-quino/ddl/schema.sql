-- Ejercicio 046 - Intermedio - INNER JOIN Restaurante Comida Urbana
CREATE TABLE `ejercicio-046-int-categorias` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL
);

CREATE TABLE `ejercicio-046-int-platos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    categoria_id INT,
    precio DECIMAL(6,2) DEFAULT 0,
    FOREIGN KEY (categoria_id) REFERENCES `ejercicio-046-int-categorias`(id)
);