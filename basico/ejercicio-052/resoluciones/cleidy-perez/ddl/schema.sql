-- Campuslands MySQL - basico ejercicio 022
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE proyectos_animacion_3d (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(120) NOT NULL,
    estudio VARCHAR(100) NOT NULL,
    software_principal ENUM('Blender', 'Maya', 'Cinema 4D', 'Unreal Engine') NOT NULL,
    duracion_segundos INT NOT NULL CHECK (duracion_segundos > 0),
    fotogramas_totales INT NOT NULL CHECK (fotogramas_totales > 0),
    tiempo_render_horas DECIMAL(6,2) NOT NULL,
    complejidad ENUM('Baja', 'Media', 'Alta', 'Extrema') NOT NULL,
    fecha_entrega DATE NOT NULL
);
