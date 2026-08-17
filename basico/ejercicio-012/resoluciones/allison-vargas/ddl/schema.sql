-- DDL: Modelado de entidad principal para el catálogo de Canciones en Playlist Musical
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS catalogo_canciones;

CREATE TABLE catalogo_canciones (
    cancion_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(80) NOT NULL,
    album VARCHAR(80) NOT NULL,
    genero VARCHAR(40) NOT NULL,
    duracion_segundos INT NOT NULL CHECK (duracion_segundos > 0),
    reproducciones INT NOT NULL DEFAULT 0 CHECK (reproducciones >= 0),
    estado ENUM('disponible', 'oculta', 'eliminada') DEFAULT 'disponible',
    fecha_agregada DATE NOT NULL
) ENGINE=InnoDB;
