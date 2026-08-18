-- Ejercicio 045 - Intermedio - Carga de Datos Biblioteca Gamer

-- Tabla de juegos
CREATE TABLE `ejercicio-045-int-juegos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(30) DEFAULT 'acción',
    año INT DEFAULT 2025,
    precio DECIMAL(10,2) DEFAULT 0
);

-- Tabla de usuarios
CREATE TABLE `ejercicio-045-int-usuarios` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    juego_favorito INT,
    FOREIGN KEY (juego_favorito) REFERENCES `ejercicio-045-int-juegos`(id)
);

-- Tabla de compras (relación usuarios-juegos)
CREATE TABLE `ejercicio-045-int-compras` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    juego_id INT,
    fecha_compra DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (usuario_id) REFERENCES `ejercicio-045-int-usuarios`(id),
    FOREIGN KEY (juego_id) REFERENCES `ejercicio-045-int-juegos`(id)
);