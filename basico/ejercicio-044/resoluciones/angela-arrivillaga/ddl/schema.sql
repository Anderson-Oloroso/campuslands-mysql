CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE saga_ciencia_ficcion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    libro_numero INT NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL,
    estado ENUM('publicado', 'en_escritura', 'anunciado') DEFAULT 'publicado',
    CONSTRAINT chk_libro_numero CHECK (libro_numero > 0),
    CONSTRAINT chk_calificacion CHECK (calificacion BETWEEN 0 AND 10)
);