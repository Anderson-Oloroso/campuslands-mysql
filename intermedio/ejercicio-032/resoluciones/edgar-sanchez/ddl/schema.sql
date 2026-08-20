-- Campuslands MySQL - intermedio ejercicio 032
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;


CREATE TABLE rangos_temporada (
    rango_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rango VARCHAR(50) NOT NULL UNIQUE,
    puntos_minimos INT NOT NULL CONSTRAINT chk_puntos_min CHECK (puntos_minimos >= 0),
    puntos_maximos INT NOT NULL CONSTRAINT chk_puntos_max CHECK (puntos_maximos > puntos_minimos)
);

CREATE TABLE jugadores_br (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    rango_id INT NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    nivel_cuenta INT NOT NULL DEFAULT 1 CONSTRAINT chk_nivel_cuenta CHECK (nivel_cuenta BETWEEN 1 AND 500),
    fecha_registro DATE NOT NULL,
    CONSTRAINT fk_jugadores_rangos 
        FOREIGN KEY (rango_id) REFERENCES rangos_temporada(rango_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE partidas_br (
    partida_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_partida VARCHAR(20) NOT NULL UNIQUE,
    modo_juego VARCHAR(30) NOT NULL CONSTRAINT chk_modo CHECK (modo_juego IN ('Solo', 'Duos', 'Squads')),
    mapa VARCHAR(50) NOT NULL,
    duracion_segundos INT NOT NULL CONSTRAINT chk_duracion_br CHECK (duracion_segundos > 0),
    fecha_partida DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE resultados_jugador_partida (
    resultado_id INT AUTO_INCREMENT PRIMARY KEY,
    partida_id INT NOT NULL,
    jugador_id INT NOT NULL,
    posicion_final INT NOT NULL CONSTRAINT chk_posicion CHECK (posicion_final BETWEEN 1 AND 100),
    eliminaciones INT NOT NULL DEFAULT 0 CONSTRAINT chk_kills CHECK (eliminaciones >= 0),
    dano_infligido INT NOT NULL DEFAULT 0 CONSTRAINT chk_dano CHECK (dano_infligido >= 0),
    puntos_rank_obtenidos INT NOT NULL,
    CONSTRAINT fk_resultados_partidas 
        FOREIGN KEY (partida_id) REFERENCES partidas_br(partida_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_resultados_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores_br(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_partida_jugador 
        UNIQUE (partida_id, jugador_id)
);