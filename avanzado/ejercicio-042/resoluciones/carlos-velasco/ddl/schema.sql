CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist;

CREATE TABLE canciones_playlist (
    id_cancion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    duracion_segundos INT UNSIGNED NOT NULL,
    reproducciones INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT chk_duracion_positiva
        CHECK (duracion_segundos > 0),

    CONSTRAINT chk_reproducciones_validas
        CHECK (reproducciones >= 0)
);