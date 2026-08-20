-- Ejercicio 027 - Avanzado - Window Functions Videojuego Acción y Aventura
CREATE TABLE `ejercicio-027-adv-personajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    nivel INT DEFAULT 1,
    ataque INT DEFAULT 10,
    misiones INT DEFAULT 0
);