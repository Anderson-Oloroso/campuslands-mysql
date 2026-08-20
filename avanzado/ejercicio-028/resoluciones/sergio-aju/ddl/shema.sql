CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS estudiantes_academia_avanzado;

CREATE TABLE estudiantes_academia_avanzado (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_completo VARCHAR(120) NOT NULL,
  correo VARCHAR(150) NOT NULL UNIQUE,
  programa_principal VARCHAR(80) NOT NULL,
  -- Columna JSON para almacenar metadatos flexibles (habilidades, historial de proyectos y puntajes por módulo)
  metadatos_academicos JSON DEFAULT NULL,
  estado ENUM('activo', 'pausado', 'graduado', 'retirado') NOT NULL DEFAULT 'activo',
  fecha_registro DATE NOT NULL,
  -- Restricción de validación para asegurar que la columna almacene un JSON válido
  CONSTRAINT chk_es_json CHECK (metadatos_academicos IS NULL OR JSON_VALID(metadatos_academicos))
);