USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS peliculas_miedo(
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(50) NOT NULL,
    subgenero VARCHAR(100) NOT NULL,
    recaudacion DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS reseñas_peliculas(
    reseña_id INT AUTO_INCREMENT PRIMARY KEY,
    pelicula_id INT NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    calificacion VARCHAR(50) NOT NULL,
    comentario DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reseñas_peliculas_peliculas_miedo FOREIGN KEY (pelicula_id) REFERENCES peliculas_miedo(pelicula_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_peliculas_miedo(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    pelicula_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
