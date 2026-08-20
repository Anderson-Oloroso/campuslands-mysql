CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE ciudades (
    id_ciudad INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE posiciones (
    id_posicion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE equipos_futsal (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    id_ciudad INT UNSIGNED NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT fk_equipo_ciudad
        FOREIGN KEY (id_ciudad)
        REFERENCES ciudades(id_ciudad)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE jugadores_futsal (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    numero_camiseta TINYINT UNSIGNED NOT NULL,
    id_equipo INT UNSIGNED NOT NULL,
    id_posicion INT UNSIGNED NOT NULL,

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (id_equipo)
        REFERENCES equipos_futsal(id_equipo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_jugador_posicion
        FOREIGN KEY (id_posicion)
        REFERENCES posiciones(id_posicion)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_edad_jugador
        CHECK (edad BETWEEN 16 AND 45),

    CONSTRAINT chk_numero_camiseta
        CHECK (numero_camiseta BETWEEN 1 AND 99),

    CONSTRAINT uq_numero_equipo
        UNIQUE (id_equipo, numero_camiseta)
);