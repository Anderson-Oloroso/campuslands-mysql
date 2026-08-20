-- Campuslands MySQL - intermedio ejercicio 031
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE equipos_esports (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL UNIQUE,
    tag_equipo VARCHAR(10) NOT NULL UNIQUE,
    region VARCHAR(50) NOT NULL,
    fecha_fundacion DATE NOT NULL
);

CREATE TABLE jugadores_moba (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    rol_juego VARCHAR(30) NOT NULL CONSTRAINT chk_rol_juego CHECK (rol_juego IN ('Top', 'Jungle', 'Mid', 'ADC', 'Support')),
    nacionalidad VARCHAR(50) NOT NULL,
    CONSTRAINT fk_jugadores_equipos 
        FOREIGN KEY (equipo_id) REFERENCES equipos_esports(equipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE torneos_moba (
    torneo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_torneo VARCHAR(150) NOT NULL UNIQUE,
    fase VARCHAR(50) NOT NULL CONSTRAINT chk_fase CHECK (fase IN ('Fase de Grupos', 'Cuartos de Final', 'Semifinales', 'Gran Final')),
    premio_total_usd DECIMAL(12,2) NOT NULL CONSTRAINT chk_premio CHECK (premio_total_usd >= 0.00),
    fecha_inicio DATE NOT NULL
);

CREATE TABLE partidas_torneo (
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    torneo_id INT NOT NULL,
    equipo_azul_id INT NOT NULL,
    equipo_rojo_id INT NOT NULL,
    equipo_ganador_id INT NOT NULL,
    duracion_segundos INT NOT NULL CONSTRAINT chk_duracion_partida CHECK (duracion_segundos > 0),
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_partidas_torneos 
        FOREIGN KEY (torneo_id) REFERENCES torneos_moba(torneo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidas_equipo_azul 
        FOREIGN KEY (equipo_azul_id) REFERENCES equipos_esports(equipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidas_equipo_rojo 
        FOREIGN KEY (equipo_rojo_id) REFERENCES equipos_esports(equipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partidas_equipo_ganador 
        FOREIGN KEY (equipo_ganador_id) REFERENCES equipos_esports(equipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_equipos_diferentes 
        CHECK (equipo_azul_id <> equipo_rojo_id)
);

CREATE TABLE estadisticas_jugador_partida (
    estadistica_id INT AUTO_INCREMENT PRIMARY KEY,
    partida_id INT NOT NULL,
    jugador_id INT NOT NULL,
    campeon_usado VARCHAR(50) NOT NULL,
    asesinatos INT NOT NULL DEFAULT 0 CONSTRAINT chk_kills CHECK (asesinatos >= 0),
    muertes INT NOT NULL DEFAULT 0 CONSTRAINT chk_deaths CHECK (muertes >= 0),
    asistencias INT NOT NULL DEFAULT 0 CONSTRAINT chk_assists CHECK (asistencias >= 0),
    oro_obtenido INT NOT NULL CONSTRAINT chk_oro_partida CHECK (oro_obtenido >= 0),
    CONSTRAINT fk_stats_partidas 
        FOREIGN KEY (partida_id) REFERENCES partidas_torneo(partida_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_stats_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores_moba(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_partida_jugador 
        UNIQUE (partida_id, jugador_id)
);