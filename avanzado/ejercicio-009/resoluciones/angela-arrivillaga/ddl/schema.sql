CREATE DATABASE IF NOT EXISTS kickboxing_bloqueos;
USE kickboxing_bloqueos;

CREATE TABLE tipos_bloqueo (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_bloqueo VARCHAR(50) NOT NULL UNIQUE,
    zona_afectada VARCHAR(50) NOT NULL,
    nivel_dificultad ENUM('principiante', 'intermedio', 'avanzado') DEFAULT 'principiante'
);

CREATE TABLE combates (
    id_combate INT PRIMARY KEY AUTO_INCREMENT,
    luchador_azul VARCHAR(60) NOT NULL,
    luchador_rojo VARCHAR(60) NOT NULL,
    peso_categoria VARCHAR(30) NOT NULL,
    estado VARCHAR(20) DEFAULT 'en_curso'
);

CREATE TABLE registro_bloqueos (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_combate INT,
    id_tipo INT,
    luchador_ejecutor VARCHAR(60) NOT NULL,
    exitoso BOOLEAN DEFAULT TRUE,
    timestamp_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_combate) REFERENCES combates(id_combate),
    FOREIGN KEY (id_tipo) REFERENCES tipos_bloqueo(id_tipo)
);