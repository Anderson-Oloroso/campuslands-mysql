CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS canciones;
DROP TABLE IF EXISTS artistas;


CREATE TABLE artistas (
    id_artista INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT uq_artistas_nombre
        UNIQUE (nombre),

    CONSTRAINT chk_artistas_nombre
        CHECK (CHAR_LENGTH(TRIM(nombre)) >= 2)
);


CREATE TABLE canciones (
    id_cancion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    artista_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    reproducciones INT UNSIGNED NOT NULL DEFAULT 0,
    duracion_segundos SMALLINT UNSIGNED NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT fk_canciones_artista
        FOREIGN KEY (artista_id)
        REFERENCES artistas(id_artista),

    CONSTRAINT chk_canciones_reproducciones
        CHECK (reproducciones >= 0),

    CONSTRAINT chk_canciones_duracion
        CHECK (duracion_segundos > 0),

    CONSTRAINT chk_canciones_titulo
        CHECK (CHAR_LENGTH(TRIM(titulo)) >= 2)
);  