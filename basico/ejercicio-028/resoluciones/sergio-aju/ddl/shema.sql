CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes_academia;

CREATE TABLE estudiantes_academia (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_completo VARCHAR(120) NOT NULL,
  correo VARCHAR(150) NOT NULL UNIQUE,
  programa_estudio ENUM('FullStack', 'DataScience', 'Backend', 'Frontend', 'CloudDevOps') NOT NULL,
  promedio_general DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo', 'pausado', 'graduado', 'retirado') NOT NULL DEFAULT 'activo',
  fecha_inscripcion DATE NOT NULL,
  CONSTRAINT chk_promedio_valido CHECK (promedio_general >= 0.00 AND promedio_general <= 100.00)
);