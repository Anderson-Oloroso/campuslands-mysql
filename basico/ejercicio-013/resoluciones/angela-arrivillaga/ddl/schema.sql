CREATE DATABASE IF NOT EXISTS peliculas_miedo_db;
USE peliculas_miedo_db;

CREATE TABLE peliculas (
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(80) NOT NULL,
    anio_estreno INT NOT NULL,
    duracion_minutos INT NOT NULL,
    calificacion_imdb DECIMAL(3,1) NOT NULL,
    subgenero ENUM('Sobrenatural', 'Slasher', 'Psychological', 'Zombie', 'Folk Horror') NOT NULL,
    estado_catalogo ENUM('disponible', 'proximamente', 'agotado', 'archivado') DEFAULT 'disponible',
    CONSTRAINT chk_anio CHECK (anio_estreno >= 1900),
    CONSTRAINT chk_duracion CHECK (duracion_minutos > 0),
    CONSTRAINT chk_imdb CHECK (calificacion_imdb >= 0.0 AND calificacion_imdb <= 10.0)
);