CREATE DATABASE IF NOT EXISTS saga_ciencia_ficcion;

USE saga_ciencia_ficcion;

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    episodio INT NOT NULL,
    director VARCHAR(100) NOT NULL,
    fecha_estreno DATE NOT NULL,
    duracion_minutos INT NOT NULL,
    puntuacion DECIMAL(3,1) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_episodio
        CHECK (episodio > 0),

    CONSTRAINT chk_duracion
        CHECK (duracion_minutos > 0),

    CONSTRAINT chk_puntuacion
        CHECK (puntuacion BETWEEN 0 AND 10),

    CONSTRAINT chk_estado
        CHECK (estado IN ('disponible', 'no_disponible'))
);