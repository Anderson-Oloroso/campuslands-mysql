-- Campuslands MySQL - avanzado ejercicio 022
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS plattform_animacion;
USE plattform_animacion;

-- Tabla 1: Temáticas
CREATE TABLE IF NOT EXISTS tematicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 2: Ejercicios
CREATE TABLE IF NOT EXISTS ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    dificultad VARCHAR(50) NOT NULL,
    id_tematica INT NOT NULL,
    instrucciones TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ejercicios_tematicas 
        FOREIGN KEY (id_tematica) REFERENCES tematicas(id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 3: Entregas (Proyectos desarrollados por alumnos)
CREATE TABLE IF NOT EXISTS entregas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_ejercicio INT NOT NULL,
    nombre_alumno VARCHAR(100) NOT NULL,
    url_archivo_3d VARCHAR(255),
    estado ENUM('Pendiente', 'En Revisión', 'Aprobado', 'Rechazado') DEFAULT 'Pendiente',
    calificacion DECIMAL(4,2) DEFAULT NULL,
    fecha_entrega TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_entregas_ejercicios 
        FOREIGN KEY (id_ejercicio) REFERENCES ejercicios(id) 
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;