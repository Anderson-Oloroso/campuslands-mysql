CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS partidos;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel ENUM('principiante', 'intermedio', 'avanzado') NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    fecha_registro DATE NOT NULL,

    CONSTRAINT chk_jugadores_nombre
        CHECK (CHAR_LENGTH(TRIM(nombre)) >= 3)
);

CREATE TABLE partidos (
    id_partido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    jugador1_id INT UNSIGNED NOT NULL,
    jugador2_id INT UNSIGNED NOT NULL,
    puntos_jugador1 TINYINT UNSIGNED NOT NULL,
    puntos_jugador2 TINYINT UNSIGNED NOT NULL,
    estado ENUM('finalizado', 'programado') NOT NULL,
    fecha_partido DATE NOT NULL,

    CONSTRAINT fk_partidos_jugador1
        FOREIGN KEY (jugador1_id)
        REFERENCES jugadores(id_jugador),

    CONSTRAINT fk_partidos_jugador2
        FOREIGN KEY (jugador2_id)
        REFERENCES jugadores(id_jugador),

    CONSTRAINT chk_partidos_jugadores_diferentes
        CHECK (jugador1_id <> jugador2_id),

    CONSTRAINT chk_partidos_puntos
        CHECK (
            puntos_jugador1 >= 0
            AND puntos_jugador2 >= 0
        )
);