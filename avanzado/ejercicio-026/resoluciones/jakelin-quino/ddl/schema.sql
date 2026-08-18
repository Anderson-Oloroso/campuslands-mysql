-- Ejercicio 026 - Avanzado - CTE Videojuego RPG
CREATE TABLE `ejercicio-026-adv-personajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nivel INT DEFAULT 1,
    vida INT DEFAULT 100,
    ataque INT DEFAULT 10,
    defensa INT DEFAULT 5
);