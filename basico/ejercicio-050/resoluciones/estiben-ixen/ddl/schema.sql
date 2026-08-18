-- Campuslands MySQL - basico ejercicio-050
-- Tema: estudio de tatuajes (SELECT)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_tatuajes;

CREATE TABLE citas_tatuajes (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(80) NOT NULL,
    id_artista INT NOT NULL,
    zona_cuerpo ENUM('Brazo','Espalda','Pecho','Pierna','Costillas','Cuello','Mano') NOT NULL,
    horas_sesion DECIMAL(4,2) NOT NULL,
    costo_total DECIMAL(8,2) NOT NULL,
    estado ENUM('Confirmada','Completada','Cancelada') DEFAULT 'Completada',
    fecha_cita DATE NOT NULL
);
