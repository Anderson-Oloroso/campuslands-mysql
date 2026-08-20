CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nivel INT NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CHECK (nivel BETWEEN 1 AND 100)
);

CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    mision VARCHAR(100) NOT NULL,
    dificultad ENUM('facil', 'media', 'dificil', 'legendaria') NOT NULL,
    puntuacion INT NOT NULL,
    tiempo_minutos DECIMAL(6,2) NOT NULL,
    fecha_partida DATE NOT NULL,

    CONSTRAINT fk_partidas_jugadores
        FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador),

    CONSTRAINT chk_puntuacion_positiva
        CHECK (puntuacion >= 0),

    CONSTRAINT chk_tiempo_positivo
        CHECK (tiempo_minutos > 0)
);