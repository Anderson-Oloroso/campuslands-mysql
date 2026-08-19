CREATE DATABASE IF NOT EXISTS peliculas_miedo_db;
USE peliculas_miedo_db;

CREATE TABLE peliculas (
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    codigo_pelicula VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(120) NOT NULL,
    anio_estreno INT NOT NULL,
    duracion_minutos INT NOT NULL,
    calificacion_imdb DECIMAL(3,1) NOT NULL,
    estado_pelicula ENUM('cartelera', 'streaming', 'archivo', 'proximamente') DEFAULT 'cartelera',
    CONSTRAINT chk_anio_estreno CHECK (anio_estreno >= 1900 AND anio_estreno <= 2026),
    CONSTRAINT chk_duracion_min CHECK (duracion_minutos > 0),
    CONSTRAINT chk_calificacion CHECK (calificacion_imdb >= 0.0 AND calificacion_imdb <= 10.0)
);

CREATE TABLE categorias_terror (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- Tabla puente para la relacion Muchos a Muchos (N:M) entre peliculas y categorias de terror
CREATE TABLE pelicula_categoria (
    id_pelicula INT,
    id_categoria INT,
    PRIMARY KEY (id_pelicula, id_categoria),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categorias_terror(id_categoria) ON DELETE CASCADE
);