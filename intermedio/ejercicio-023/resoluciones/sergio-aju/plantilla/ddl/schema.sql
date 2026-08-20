CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;

-- Tabla 1: Categorías (Arquitectura)
CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla 2: Clientes
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100)
);

-- Tabla 3: Proyectos (Relacionada con categorías y clientes - 3FN)
CREATE TABLE proyectos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_proyecto VARCHAR(120) NOT NULL,
  categoria_id INT,
  cliente_id INT,
  costo DECIMAL(12,2) NOT NULL,
  estado ENUM('activo', 'completado', 'pausado') DEFAULT 'activo',
  FOREIGN KEY (categoria_id) REFERENCES categorias(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);