-- Campuslands MySQL - basico ejercicio 015
-- Ejecuta este archivo antes de inserts.sql.

<<<<<<< HEAD
CREATE DATABASE IF NOT EXISTS biblioteca_gamer_db;
USE biblioteca_gamer_db;


CREATE TABLE juegos (
    id_juego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    genero VARCHAR(50) NOT NULL, 
    plataforma VARCHAR(50) DEFAULT 'PC', 
    precio DECIMAL(6,2) NOT NULL CHECK (precio >= 0)
);


CREATE TABLE biblioteca_usuario (
    id_biblioteca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    id_juego INT NOT NULL,
    horas_jugadas DECIMAL(6,1) DEFAULT 0.0 CHECK (horas_jugadas >= 0),
    estado ENUM('Jugando', 'Completado', 'Pendiente', 'Abandonado') DEFAULT 'Pendiente',
    fecha_adquisicion DATE NOT NULL,
    FOREIGN KEY (id_juego) REFERENCES juegos(id_juego) ON DELETE CASCADE
=======
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE Plataformas (
    plataforma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    desarrollador VARCHAR(50) NOT NULL
);

CREATE TABLE Videojuegos (
    juego_id INT AUTO_INCREMENT PRIMARY KEY,
    plataforma_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    horas_jugadas INT NOT NULL CHECK (horas_jugadas >= 0),
    FOREIGN KEY (plataforma_id) REFERENCES Plataformas(plataforma_id) ON DELETE CASCADE
>>>>>>> upstream/dev
);