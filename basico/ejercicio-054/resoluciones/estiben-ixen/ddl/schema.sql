-- Campuslands MySQL - basico ejercicio-054
-- Tema: soldadura (DELETE controlado)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_soldadura;

CREATE TABLE proyectos_soldadura (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estructura VARCHAR(80) NOT NULL,
    id_taller INT NOT NULL,
    proceso_soldadura ENUM('SMAW (Electrodo)','GMAW (MIG/MAG)','GTAW (TIG)','FCAW (Tubular)','SAW (Arco Sumergido)') NOT NULL,
    tipo_material ENUM('Acero al Carbono ASTM A36','Acero Inoxidable 316L','Aluminio 6061','Titanio Grado 5') NOT NULL,
    peso_toneladas DECIMAL(8,2) NOT NULL,
    inspeccion_radiografica ENUM('Aprobado','Con Defectos','Pendiente') DEFAULT 'Aprobado',
    costo_total DECIMAL(9,2) NOT NULL
);
