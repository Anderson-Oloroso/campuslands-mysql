-- Campuslands MySQL - avanzado ejercicio 028
-- Resolucion: maria-montepeque
-- Tema: academia tech
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes_avanzado;

CREATE TABLE estudiantes_avanzado (
  id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  programa ENUM('desarrollo_web','ciencia_datos','ciberseguridad','devops','diseno_ux') NOT NULL,
  perfil JSON NOT NULL,
  -- Valida la forma minima esperada del JSON: debe tener "habilidades"
  -- (arreglo) y "contacto" (objeto). MySQL puede validar estructura
  -- basica de un JSON directamente en un CHECK.
  CONSTRAINT chk_estudiantes_avanzado_perfil CHECK (
    JSON_TYPE(JSON_EXTRACT(perfil, '$.habilidades')) = 'ARRAY'
    AND JSON_TYPE(JSON_EXTRACT(perfil, '$.contacto')) = 'OBJECT'
  )
);
