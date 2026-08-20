CREATE DATABASE IF NOT EXISTS catalogo_peliculas_miedo;

USE catalogo_peliculas_miedo;

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    clasificacion VARCHAR(10) NOT NULL,
    duracion_minutos INT NOT NULL,
    puntuacion DECIMAL(3,1) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',
    fecha_estreno DATE NOT NULL,

    CONSTRAINT chk_duracion
        CHECK (duracion_minutos > 0),

    CONSTRAINT chk_puntuacion
        CHECK (puntuacion BETWEEN 0 AND 10),

    CONSTRAINT chk_estado
        CHECK (estado IN ('disponible', 'no_disponible'))
);