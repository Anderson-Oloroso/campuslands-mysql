-- Campuslands MySQL - intermedio ejercicio 039
-- Resolucion: maria-montepeque
-- Tema: kickboxing
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS clases_kickboxing_intermedio;
DROP TABLE IF EXISTS alumnos_kickboxing_intermedio;
DROP TABLE IF EXISTS entrenadores_kickboxing_intermedio;

CREATE TABLE entrenadores_kickboxing_intermedio (
  id_entrenador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  especialidad ENUM('semicontacto','contacto_pleno','light_contact','k1') NOT NULL
);

CREATE TABLE alumnos_kickboxing_intermedio (
  id_alumno INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  telefono VARCHAR(20) NOT NULL
);

-- Dos FOREIGN KEY con comportamiento distinto a proposito, para
-- comparar las opciones de MySQL ante un DELETE en la tabla padre:
--
-- id_entrenador -> ON DELETE SET NULL: si el entrenador se retira del
-- gimnasio, la clase historica se conserva (no se pierde el registro
-- de facturacion), solo queda sin entrenador asignado.
--
-- id_alumno -> ON DELETE RESTRICT: un alumno con clases registradas NO
-- se puede borrar mientras existan esas clases, para no perder el
-- historial de pagos de ese alumno.
CREATE TABLE clases_kickboxing_intermedio (
  id_clase INT AUTO_INCREMENT PRIMARY KEY,
  id_entrenador INT NULL,
  id_alumno INT NOT NULL,
  tipo_clase ENUM('individual','grupal','sparring') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_clase DATE NOT NULL,
  CONSTRAINT fk_clases_intermedio_entrenador FOREIGN KEY (id_entrenador) REFERENCES entrenadores_kickboxing_intermedio (id_entrenador) ON DELETE SET NULL,
  CONSTRAINT fk_clases_intermedio_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos_kickboxing_intermedio (id_alumno) ON DELETE RESTRICT,
  CONSTRAINT chk_clases_intermedio_costo CHECK (costo > 0)
);
