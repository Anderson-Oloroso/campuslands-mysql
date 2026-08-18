-- Campuslands MySQL - basico ejercicio 014
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE saga_peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    episodio_numero INT NOT NULL,
    fecha_estreno_cine DATE NOT NULL, 
    presupuesto_millones DECIMAL(6,2)
);


CREATE TABLE cronologia_historia (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT NOT NULL,
    nombre_evento VARCHAR(150) NOT NULL,
    anio_en_la_ficcion INT NOT NULL, 
    planeta_o_lugar VARCHAR(80) DEFAULT 'Desconocido',
    FOREIGN KEY (id_pelicula) REFERENCES saga_peliculas(id_pelicula) ON DELETE CASCADE
);

CREATE TABLE eventos_comunidad (
    id_evento_comunidad INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT NOT NULL,
    tipo_evento ENUM('Tráiler', 'Convención', 'Lanzamiento Blu-Ray', 'Panel Comic-Con') NOT NULL,
    nombre_evento VARCHAR(100) NOT NULL,
    fecha_evento DATE NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES saga_peliculas(id_pelicula) ON DELETE CASCADE
);
