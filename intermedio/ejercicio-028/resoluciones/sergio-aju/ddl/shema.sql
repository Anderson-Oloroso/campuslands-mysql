CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de llaves foráneas
DROP TABLE IF EXISTS inscripciones_cursos;
DROP TABLE IF EXISTS cursos_academia;
DROP TABLE IF EXISTS estudiantes_academia_intermedio;

-- 1. Tabla de Estudiantes
CREATE TABLE estudiantes_academia_intermedio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_completo VARCHAR(120) NOT NULL,
  correo VARCHAR(150) NOT NULL UNIQUE,
  estado ENUM('activo', 'pausado', 'graduado', 'retirado') NOT NULL DEFAULT 'activo',
  fecha_registro DATE NOT NULL
);

-- 2. Tabla de Cursos
CREATE TABLE cursos_academia (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_curso VARCHAR(100) NOT NULL,
  categoria VARCHAR(60) NOT NULL,
  duracion_semanas INT NOT NULL,
  CONSTRAINT chk_duracion CHECK (duracion_semanas > 0)
);

-- 3. Tabla Puente (Relación Muchos a Muchos entre Estudiantes y Cursos)
CREATE TABLE inscripciones_cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estudiante_id INT NOT NULL,
  curso_id INT NOT NULL,
  calificacion_final DECIMAL(5,2) DEFAULT NULL,
  estado_inscripcion ENUM('cursando', 'comprobado', 'aprobado', 'reprobado') NOT NULL DEFAULT 'cursando',
  fecha_inscripcion DATE NOT NULL,
  CONSTRAINT fk_inscripcion_estudiante FOREIGN KEY (estudiante_id) REFERENCES estudiantes_academia_intermedio(id) ON DELETE CASCADE,
  CONSTRAINT fk_inscripcion_curso FOREIGN KEY (curso_id) REFERENCES cursos_academia(id) ON DELETE CASCADE,
  CONSTRAINT chk_calificacion CHECK (calificacion_final IS NULL OR (calificacion_final >= 0.00 AND calificacion_final <= 100.00)),
  CONSTRAINT uk_estudiante_curso UNIQUE (estudiante_id, curso_id)
);