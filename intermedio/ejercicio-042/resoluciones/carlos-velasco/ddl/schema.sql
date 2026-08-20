CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS canciones;

CREATE TABLE canciones (
    id_cancion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    duracion_segundos SMALLINT UNSIGNED NOT NULL,
    reproducciones INT UNSIGNED NOT NULL DEFAULT 0,
    calificacion DECIMAL(3,1) NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT chk_duracion_cancion
        CHECK (duracion_segundos BETWEEN 30 AND 900),

    CONSTRAINT chk_reproducciones_cancion
        CHECK (reproducciones >= 0),

    CONSTRAINT chk_calificacion_cancion
        CHECK (calificacion BETWEEN 0.0 AND 5.0)
);