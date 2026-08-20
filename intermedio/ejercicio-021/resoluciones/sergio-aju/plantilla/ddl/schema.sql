CREATE DATABASE IF NOT EXISTS campuslands_dibujo_digital;
USE campuslands_dibujo_digital;

-- Tabla 1: Obras
CREATE TABLE obras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    fecha_creacion DATE NOT NULL,
    puntaje_calidad DECIMAL(5,2) DEFAULT 0.00
);

-- Tabla 2: Tecnicas (Para evitar grupos repetidos y cumplir 1FN)
CREATE TABLE tecnicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tecnica VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla Intermedia: Obras_Tecnicas
CREATE TABLE obras_tecnicas (
    obra_id INT,
    tecnica_id INT,
    PRIMARY KEY (obra_id, tecnica_id),
    FOREIGN KEY (obra_id) REFERENCES obras(id) ON DELETE CASCADE,
    FOREIGN KEY (tecnica_id) REFERENCES tecnicas(id)
);