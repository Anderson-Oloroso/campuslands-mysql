USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS peliculas_miedo(
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(50) NOT NULL,
    subgenero VARCHAR(100) NOT NULL,
    recaudacion DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
