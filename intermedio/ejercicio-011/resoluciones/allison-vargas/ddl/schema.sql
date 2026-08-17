-- DDL: Estructura de partidos de Ping-Pong con restricciones CHECK complejas de puntuación
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS marcadores_pingpong;

CREATE TABLE marcadores_pingpong (
    marcador_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_local VARCHAR(80) NOT NULL,
    jugador_visitante VARCHAR(80) NOT NULL,
    puntos_local INT NOT NULL,
    puntos_visitante INT NOT NULL,
    set_numero INT NOT NULL CHECK (set_numero BETWEEN 1 AND 7),
    duracion_minutos DECIMAL(4,1) NOT NULL,
    categoria ENUM('Sub-18', 'Mayores', 'Veteranos') NOT NULL,
    CONSTRAINT chk_puntos_positivos CHECK (puntos_local >= 0 AND puntos_visitante >= 0),
    CONSTRAINT chk_puntuacion_minima CHECK (puntos_local >= 11 OR puntos_visitante >= 11),
    CONSTRAINT chk_diferencia_deuce CHECK (ABS(puntos_local - puntos_visitante) >= 2),
    CONSTRAINT chk_duracion_valida CHECK (duracion_minutos > 0.0 AND duracion_minutos <= 120.0),
    CONSTRAINT chk_jugadores_distintos CHECK (jugador_local <> jugador_visitante)
) ENGINE=InnoDB;
