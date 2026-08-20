-- Campuslands MySQL - intermedio ejercicio 027
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE plataformas_juego (
    plataforma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_plataforma VARCHAR(50) NOT NULL UNIQUE,
    fabricante VARCHAR(50) NOT NULL,
    tipo_hardware VARCHAR(30) NOT NULL CONSTRAINT chk_hardware CHECK (tipo_hardware IN ('Consola', 'PC', 'Portátil', 'Nube'))
);

CREATE TABLE jugadores_accion (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    gamer_tag VARCHAR(50) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE misiones_juego (
    mision_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_mision VARCHAR(20) NOT NULL UNIQUE,
    nombre_mision VARCHAR(100) NOT NULL,
    region_mapa VARCHAR(50) NOT NULL,
    nivel_dificultad VARCHAR(20) NOT NULL CONSTRAINT chk_dificultad CHECK (nivel_dificultad IN ('Fácil', 'Normal', 'Difícil', 'Extremo')),
    recompensa_xp INT NOT NULL CONSTRAINT chk_xp CHECK (recompensa_xp > 0)
);

CREATE TABLE partidas_jugador (
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    plataforma_id INT NOT NULL,
    mision_id INT NOT NULL,
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    duracion_minutos DECIMAL(5,2) NOT NULL CONSTRAINT chk_duracion CHECK (duracion_minutos > 0.00),
    puntuaciones_obtenidas INT NOT NULL CONSTRAINT chk_puntos CHECK (puntuaciones_obtenidas >= 0),
    mision_completada BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_partidas_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores_accion(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidas_plataformas 
        FOREIGN KEY (plataforma_id) REFERENCES plataformas_juego(plataforma_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidas_misiones 
        FOREIGN KEY (mision_id) REFERENCES misiones_juego(mision_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);