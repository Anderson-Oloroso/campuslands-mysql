CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS posiciones;
DROP TABLE IF EXISTS equipos;


CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,

    CONSTRAINT uq_equipo_nombre
        UNIQUE (nombre)
);


CREATE TABLE posiciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,

    CONSTRAINT uq_posicion_nombre
        UNIQUE (nombre)
);


CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    numero_camiseta INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',
    equipo_id INT NOT NULL,
    posicion_id INT NOT NULL,

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (equipo_id)
        REFERENCES equipos(id),

    CONSTRAINT fk_jugador_posicion
        FOREIGN KEY (posicion_id)
        REFERENCES posiciones(id),

    CONSTRAINT uq_jugador_equipo_numero
        UNIQUE (equipo_id, numero_camiseta),

    CONSTRAINT chk_jugador_edad
        CHECK (edad >= 16 AND edad <= 50),

    CONSTRAINT chk_numero_camiseta
        CHECK (numero_camiseta BETWEEN 1 AND 99),

    CONSTRAINT chk_goles
        CHECK (goles >= 0),

    CONSTRAINT chk_estado
        CHECK (estado IN ('activo', 'lesionado', 'suspendido'))
);