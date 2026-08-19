CREATE DATABASE IF NOT EXISTS academia_tech_db;
USE academia_tech_db;

CREATE TABLE estudiantes_academia (
    id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    codigo_estudiante VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    programa_academico VARCHAR(50) NOT NULL,
    promedio_calificacion DECIMAL(4,2) NOT NULL,
    estado_academico ENUM('activo', 'graduado', 'suspendido', 'retirado') DEFAULT 'activo',
    CONSTRAINT chk_promedio CHECK (promedio_calificacion >= 0.00 AND promedio_calificacion <= 100.00)
);