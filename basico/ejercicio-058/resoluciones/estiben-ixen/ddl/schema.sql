-- Campuslands MySQL - basico ejercicio-058
-- Tema: academia tech (filtros por estado)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS campers_estudiantes;

CREATE TABLE campers_estudiantes (
    id_camper INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    id_ruta INT NOT NULL,
    promedio_acumulado DECIMAL(4,2) NOT NULL DEFAULT 0.00,
    proyectos_aprobados INT NOT NULL DEFAULT 0,
    estado ENUM('En Proceso','Graduado','En Riesgo','Retirado') DEFAULT 'En Proceso',
    fecha_ingreso DATE NOT NULL
);
