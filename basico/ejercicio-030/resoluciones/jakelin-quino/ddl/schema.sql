-- Ejercicio 030 - Básico - Relaciones Simples Equipo de Streaming
CREATE TABLE `ejercicio-030-bas-streamers` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    plataforma VARCHAR(30) NOT NULL,
    seguidores INT DEFAULT 0
);

CREATE TABLE `ejercicio-030-bas-equipos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    streamer_id INT,
    juego_principal VARCHAR(50) NOT NULL,
    FOREIGN KEY (streamer_id) REFERENCES `ejercicio-030-bas-streamers`(id)
);