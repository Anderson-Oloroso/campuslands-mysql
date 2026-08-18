-- Ejercicio 056 - Básico - Validaciones Simples Videojuego RPG
CREATE TABLE `ejercicio-056-bas-personajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nivel INT DEFAULT 1 CHECK (nivel BETWEEN 1 AND 100),
    vida INT DEFAULT 100 CHECK (vida >= 0),
    clase VARCHAR(20) DEFAULT 'guerrero' 
        CHECK (clase IN ('guerrero', 'mago', 'arquero', 'picaro'))
);