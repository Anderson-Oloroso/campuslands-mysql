-- Campuslands MySQL - basico ejercicio 023
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE renderizados_arquitectura (
    id_render INT AUTO_INCREMENT PRIMARY KEY,
    proyecto VARCHAR(120) NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    motor_render ENUM('V-Ray', 'Corona', 'Lumion', 'Unreal Engine', 'D5 Render') NOT NULL,
    resolucion VARCHAR(20) DEFAULT '1080p',
    precio DECIMAL(8,2) NOT NULL CHECK (precio > 0),
    estado ENUM('Borrador', 'En Render', 'Revision', 'Aprobado') DEFAULT 'Borrador',
    tiempo_render_minutos INT DEFAULT 0
);
