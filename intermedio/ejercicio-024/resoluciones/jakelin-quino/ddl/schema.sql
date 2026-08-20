-- Ejercicio 024 - Intermedio - FOREIGN KEY Soldadura
CREATE TABLE `ejercicio-024-int-materiales` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    punto_fusion INT DEFAULT 0
);

CREATE TABLE `ejercicio-024-int-proyectos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    material_id INT,
    temperatura INT DEFAULT 0,
    FOREIGN KEY (material_id) REFERENCES `ejercicio-024-int-materiales`(id)
);