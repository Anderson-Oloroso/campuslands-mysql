-- Ejercicio 027 - Básico - Modelado de Entidad Videojuego Acción y Aventura
CREATE TABLE `ejercicio-027-bas-personajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    nivel INT DEFAULT 1,
    vida INT DEFAULT 100,
    ataque INT DEFAULT 10
);