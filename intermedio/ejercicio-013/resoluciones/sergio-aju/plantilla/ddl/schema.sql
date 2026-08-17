CREATE DATABASE IF NOT EXISTS campuslands_mysql; USE campuslands_mysql;

DROP TABLE IF EXISTS pelicula_etiqueta; DROP TABLE IF EXISTS etiquetas_miedo; DROP TABLE IF EXISTS intermedio_ejercicio_013;

-- Tabla principal (Catálogo basado en tu plantilla)
CREATE TABLE intermedio_ejercicio_013 ( id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(120) NOT NULL, categoria VARCHAR(80) NOT NULL, puntaje DECIMAL(10,2) NOT NULL DEFAULT 0, estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo', creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP );

-- Tabla secundaria (Para crear la relación muchos a muchos)
CREATE TABLE etiquetas_miedo ( id_etiqueta INT AUTO_INCREMENT PRIMARY KEY, nombre_etiqueta VARCHAR(50) NOT NULL UNIQUE );

-- Tabla Puente
CREATE TABLE pelicula_etiqueta ( id_pelicula INT, id_etiqueta INT, PRIMARY KEY (id_pelicula, id_etiqueta), FOREIGN KEY (id_pelicula) REFERENCES intermedio_ejercicio_013(id) ON DELETE CASCADE, FOREIGN KEY (id_etiqueta) REFERENCES etiquetas_miedo(id_etiqueta) ON DELETE CASCADE );