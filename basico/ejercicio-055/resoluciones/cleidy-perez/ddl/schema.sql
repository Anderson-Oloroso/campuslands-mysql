-- Campuslands MySQL - basico ejercicio 025
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE ensayo_formulas_quimicas (
    id_ensayo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_formula VARCHAR(120) NOT NULL,
    categoria ENUM('Reactivo', 'Solución', 'Compuesto Orgánico', 'Síntesis') NOT NULL,
    volumen_ml DECIMAL(8,2) NOT NULL CHECK (volumen_ml > 0),
    costo_reactivo DECIMAL(8,2) NOT NULL CHECK (costo_reactivo >= 0),
    quimico_a_cargo VARCHAR(100) NOT NULL,
    fecha_ensayo DATE NOT NULL
);
