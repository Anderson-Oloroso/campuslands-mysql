CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE dibujos_digitales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    tecnica VARCHAR(50) NOT NULL,
    puntaje DECIMAL(5,2) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion DATE NOT NULL,

    CONSTRAINT chk_dibujos_puntaje
        CHECK (puntaje BETWEEN 0 AND 100)
);