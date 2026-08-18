CREATE TABLE directores_miedo (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_director VARCHAR(100) NOT NULL UNIQUE,
    nacionalidad VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE subgeneros_miedo (
    subgenero_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_subgenero VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT NOT NULL
);

CREATE TABLE peliculas_miedo (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    director_id INT NOT NULL,
    titulo_espanol VARCHAR(150) NOT NULL,
    titulo_original VARCHAR(150) NOT NULL,
    anio_estreno INT NOT NULL CONSTRAINT chk_anio_estreno CHECK (anio_estreno BETWEEN 1895 AND 2026),
    duracion_minutos INT NOT NULL CONSTRAINT chk_duracion_minutos CHECK (duracion_minutos > 0),
    clasificacion_edad VARCHAR(10) NOT NULL CONSTRAINT chk_clasificacion CHECK (clasificacion_edad IN ('PG-13', 'R', 'NC-17', 'Unrated')),
    presupuesto_usd DECIMAL(12,2) NOT NULL CONSTRAINT chk_presupuesto CHECK (presupuesto_usd >= 0.00),
    recaudacion_usd DECIMAL(12,2) NOT NULL CONSTRAINT chk_recaudacion CHECK (recaudacion_usd >= 0.00),
    CONSTRAINT fk_peliculas_directores 
        FOREIGN KEY (director_id) REFERENCES directores_miedo(director_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE peliculas_subgeneros (
    pelicula_id INT NOT NULL,
    subgenero_id INT NOT NULL,
    nivel_relevancia VARCHAR(20) NOT NULL DEFAULT 'Principal' CONSTRAINT chk_nivel_relevancia CHECK (nivel_relevancia IN ('Principal', 'Secundario')),
    PRIMARY KEY (pelicula_id, subgenero_id),
    CONSTRAINT fk_puente_peliculas 
        FOREIGN KEY (pelicula_id) REFERENCES peliculas_miedo(pelicula_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_puente_subgeneros 
        FOREIGN KEY (subgenero_id) REFERENCES subgeneros_miedo(subgenero_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);