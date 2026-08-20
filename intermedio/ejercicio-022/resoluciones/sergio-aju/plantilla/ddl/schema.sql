CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de FK
DROP TABLE IF EXISTS basico_ejercicio_022;
DROP TABLE IF EXISTS proyectos_animacion;
DROP TABLE IF EXISTS categorias_animacion;

-- Tabla normalizada de categorías (Evita redundancia de texto y cumple con 2FN)
CREATE TABLE categorias_animacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(80) NOT NULL UNIQUE,
  descripcion VARCHAR(255)
);

-- Tabla principal de proyectos vinculada a categorías
CREATE TABLE proyectos_animacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  categoria_id INT NOT NULL,
  puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('activo','revision','inactivo') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_proyecto_categoria FOREIGN KEY (categoria_id) REFERENCES categorias_animacion(id)
);