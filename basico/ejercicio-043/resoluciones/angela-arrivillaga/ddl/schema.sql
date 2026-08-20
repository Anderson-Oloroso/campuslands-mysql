CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE peliculas_miedo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    subgenero ENUM('slasher', 'sobrenatural', 'psicologico', 'zombies', 'gore') NOT NULL,
    anio_estreno INT NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL,
    estado ENUM('disponible', 'agotada', 'proximamente') DEFAULT 'disponible',
    CONSTRAINT chk_anio CHECK (anio_estreno >= 1900),
    CONSTRAINT chk_calificacion CHECK (calificacion BETWEEN 0 AND 10)
);