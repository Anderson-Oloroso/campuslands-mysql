DROP TABLE IF EXISTS calificaciones_peliculas;
DROP TABLE IF EXISTS peliculas_miedo;
DROP TABLE IF EXISTS directores_cine;
DROP TABLE IF EXISTS estudios_cinematograficos;

CREATE TABLE estudios_cinematograficos (
    estudio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudio VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    anio_fundacion INT NOT NULL CONSTRAINT chk_fundacion_estudio CHECK (anio_fundacion BETWEEN 1890 AND 2026)
);

CREATE TABLE directores_cine (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_director VARCHAR(100) NOT NULL UNIQUE,
    nacionalidad VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE peliculas_miedo (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    estudio_id INT NOT NULL,
    director_id INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno INT NOT NULL CONSTRAINT chk_anio_estreno CHECK (anio_estreno BETWEEN 1900 AND 2026),
    duracion_minutos INT NOT NULL CONSTRAINT chk_duracion_pelicula CHECK (duracion_minutos > 0),
    metadatos_json JSON NOT NULL,
    CONSTRAINT fk_peliculas_estudios 
        FOREIGN KEY (estudio_id) REFERENCES estudios_cinematograficos(estudio_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_peliculas_directores 
        FOREIGN KEY (director_id) REFERENCES directores_cine(director_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_director_titulo 
        UNIQUE (director_id, titulo)
);

CREATE TABLE calificaciones_peliculas (
    calificacion_id INT AUTO_INCREMENT PRIMARY KEY,
    pelicula_id INT NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    puntuacion DECIMAL(3,1) NOT NULL CONSTRAINT chk_puntuacion CHECK (puntuacion BETWEEN 0.0 AND 10.0),
    resena_detalles_json JSON NOT NULL,
    fecha_registro DATE NOT NULL,
    CONSTRAINT fk_calificaciones_peliculas 
        FOREIGN KEY (pelicula_id) REFERENCES peliculas_miedo(pelicula_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_pelicula_plataforma 
        UNIQUE (pelicula_id, plataforma)
);