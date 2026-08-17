-- Campuslands MySQL - intermedio ejercicio 028
-- Resolucion: maria-montepeque
-- Tema: academia tech
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inscripciones_intermedio;
DROP TABLE IF EXISTS cursos_intermedio;
DROP TABLE IF EXISTS estudiantes_intermedio;

CREATE TABLE estudiantes_intermedio (
  id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  email VARCHAR(160) NOT NULL UNIQUE
);

CREATE TABLE cursos_intermedio (
  id_curso INT AUTO_INCREMENT PRIMARY KEY,
  nombre_curso VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('backend','frontend','datos','infraestructura','seguridad') NOT NULL,
  duracion_horas INT NOT NULL,
  CONSTRAINT chk_cursos_intermedio_duracion CHECK (duracion_horas > 0)
);

-- Tabla puente: un estudiante puede inscribirse en varios cursos y un
-- curso puede tener varios estudiantes (muchos a muchos). La llave
-- primaria compuesta evita que el mismo estudiante quede inscrito dos
-- veces en el mismo curso.
CREATE TABLE inscripciones_intermedio (
  id_estudiante INT NOT NULL,
  id_curso INT NOT NULL,
  fecha_inscripcion DATE NOT NULL,
  calificacion_final DECIMAL(4,2) NULL,
  PRIMARY KEY (id_estudiante, id_curso),
  CONSTRAINT fk_inscripciones_intermedio_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes_intermedio (id_estudiante),
  CONSTRAINT fk_inscripciones_intermedio_curso FOREIGN KEY (id_curso) REFERENCES cursos_intermedio (id_curso),
  CONSTRAINT chk_inscripciones_intermedio_calificacion CHECK (calificacion_final IS NULL OR calificacion_final BETWEEN 0 AND 5)
);
