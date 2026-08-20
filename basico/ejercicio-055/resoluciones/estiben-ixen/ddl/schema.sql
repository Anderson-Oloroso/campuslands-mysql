-- Campuslands MySQL - basico ejercicio-055
-- Tema: laboratorio de formulas quimicas (COUNT y SUM)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reactivos_quimicos;

CREATE TABLE reactivos_quimicos (
    id_reactivo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_quimico VARCHAR(80) NOT NULL,
    formula_molecular VARCHAR(40) NOT NULL,
    id_laboratorio INT NOT NULL,
    pureza_porcentaje DECIMAL(5,2) NOT NULL,
    clasificacion_peligro ENUM('Inflamable','Corrosivo','Toxico','Explosivo','Comburente','Inerte') NOT NULL,
    stock_gramos DECIMAL(10,2) NOT NULL,
    temperatura_almacenamiento_c INT NOT NULL DEFAULT 20
);
