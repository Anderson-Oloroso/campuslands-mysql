CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes;

CREATE TABLE estudiantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  documento_identidad VARCHAR(20) NOT NULL UNIQUE,
  nombre_completo VARCHAR(100) NOT NULL,
  programa_academico ENUM('Backend', 'Frontend', 'Fullstack', 'DataScience') NOT NULL,
  promedio_academico DECIMAL(4,2) DEFAULT 0.00,
  estado_estudiante ENUM('activo', 'pausado', 'graduado', 'desertor') NOT NULL DEFAULT 'activo',
  fecha_ingreso DATE NOT NULL,
  
  CONSTRAINT chk_promedio CHECK (promedio_academico >= 0.0 AND promedio_academico <= 10.0)
);