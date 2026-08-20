-- Campuslands MySQL - avanzado ejercicio-058
-- Tema: academia tech (JSON en MySQL)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_academia_tech;
DROP TABLE IF EXISTS campers_estudiantes;
DROP TABLE IF EXISTS rutas_aprendizaje;

CREATE TABLE rutas_aprendizaje (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ruta VARCHAR(60) NOT NULL UNIQUE,
    duracion_meses INT NOT NULL DEFAULT 6,
    tecnologia_principal VARCHAR(50) NOT NULL
);

CREATE TABLE campers_estudiantes (
    id_camper INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    id_ruta INT NOT NULL,
    promedio_acumulado DECIMAL(4,2) NOT NULL DEFAULT 0.00,
    proyectos_aprobados INT NOT NULL DEFAULT 0,
    estado ENUM('En Proceso','Graduado','En Riesgo','Retirado') DEFAULT 'En Proceso',
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (id_ruta) REFERENCES rutas_aprendizaje(id_ruta) ON DELETE CASCADE
);

-- Columna de tipo JSON para metadata avanzada
ALTER TABLE campers_estudiantes ADD COLUMN IF NOT EXISTS metadata_json JSON;
