-- Campuslands MySQL - intermedio ejercicio 023
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS academia_arquitectura3d;
USE academia_arquitectura3d;

-- 1. Tabla Temáticas
CREATE TABLE IF NOT EXISTS tematicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Tabla Instructores (Elimina dependencia transitiva del ejercicio)
CREATE TABLE IF NOT EXISTS instructores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Tabla Ejercicios (En 3FN, id_tematica e id_instructor son FK)
CREATE TABLE IF NOT EXISTS ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    dificultad VARCHAR(50) NOT NULL,
    id_tematica INT NOT NULL,
    id_instructor INT NOT NULL,
    contexto TEXT,
    objetivo TEXT,
    FOREIGN KEY (id_tematica) REFERENCES tematicas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_instructor) REFERENCES instructores(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Tabla Estudiantes
CREATE TABLE IF NOT EXISTS estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
