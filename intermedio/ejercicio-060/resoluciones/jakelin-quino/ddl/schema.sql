-- Ejercicio 060 - Intermedio - Carga de Datos Equipo de Streaming
CREATE TABLE `ejercicio-060-int-streamers` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    plataforma VARCHAR(30) NOT NULL,
    seguidores INT DEFAULT 0
);

CREATE TABLE `ejercicio-060-int_equipos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    streamer_id INT,
    juego_principal VARCHAR(50) NOT NULL,
    FOREIGN KEY (streamer_id) REFERENCES `ejercicio-060-int-streamers`(id)
);