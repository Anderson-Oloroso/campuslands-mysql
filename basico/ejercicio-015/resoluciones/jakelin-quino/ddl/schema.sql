-- Ejercicio 015 - Básico - Relaciones Simples Biblioteca Gamer

-- Tabla de juegos
CREATE TABLE `ejercicio-015-bas-juegos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(30) DEFAULT 'acción',
    año INT DEFAULT 2025,
    precio DECIMAL(10,2) DEFAULT 0
);

-- Tabla de usuarios (con relación a juegos)
CREATE TABLE `ejercicio-015-bas-usuarios` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    juego_favorito INT,
    FOREIGN KEY (juego_favorito) REFERENCES `ejercicio-015-bas-juegos`(id)
);