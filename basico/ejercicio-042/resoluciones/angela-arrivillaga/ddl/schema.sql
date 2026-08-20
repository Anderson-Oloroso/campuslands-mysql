CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE canciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    album VARCHAR(100),
    duracion_segundos INT NOT NULL CHECK (duracion_segundos > 0),
    genero ENUM('rock', 'pop', 'jazz', 'clasica', 'electronica') NOT NULL,
    puntaje DECIMAL(3, 1) DEFAULT 0.0 CHECK (puntaje BETWEEN 0.0 AND 10.0),
    estado ENUM('activo', 'archivado') DEFAULT 'activo'
);