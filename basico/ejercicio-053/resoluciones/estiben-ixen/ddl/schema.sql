-- Campuslands MySQL - basico ejercicio-053
-- Tema: arquitectura 3D (UPDATE)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_bim;

CREATE TABLE proyectos_bim (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_obra VARCHAR(90) NOT NULL,
    id_firma INT NOT NULL,
    tipologia ENUM('Residencial Lujo','Rascacielos Corporativo','Museo/Cultural','Hospitalario','Comercial') NOT NULL,
    area_m2 DECIMAL(10,2) NOT NULL,
    presupuesto_millones DECIMAL(8,2) NOT NULL,
    software_bim ENUM('Revit BIM','Archicad','Rhino Grasshopper','SketchUp Pro') NOT NULL,
    estado_proyecto ENUM('En Diseno','Aprobado','En Construccion','Finalizado') DEFAULT 'En Diseno'
);
