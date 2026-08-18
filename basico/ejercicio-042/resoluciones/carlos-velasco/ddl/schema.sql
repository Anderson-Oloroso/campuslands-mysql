CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist;

CREATE TABLE canciones_playlist (
    id_cancion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    album VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    duracion_segundos SMALLINT UNSIGNED NOT NULL,
    anio_lanzamiento YEAR NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'activa',

    CONSTRAINT uq_cancion_artista
        UNIQUE (titulo, artista),

    CONSTRAINT chk_duracion_cancion
        CHECK (duracion_segundos > 0),

    CONSTRAINT chk_anio_lanzamiento
        CHECK (anio_lanzamiento >= 1900),

    CONSTRAINT chk_estado_cancion
        CHECK (estado IN ('activa', 'inactiva'))
);