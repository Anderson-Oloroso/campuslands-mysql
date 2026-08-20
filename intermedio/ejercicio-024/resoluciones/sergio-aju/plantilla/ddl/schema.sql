CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS procesos_soldadura;
DROP TABLE IF EXISTS metodos_soldadura;
DROP TABLE IF EXISTS tecnicos_soldadura;

-- Tabla maestra 1: Métodos de soldadura (Relación 1 a Muchos)
CREATE TABLE metodos_soldadura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_metodo VARCHAR(50) NOT NULL UNIQUE,
  descripcion_metodo VARCHAR(255)
);

-- Tabla maestra 2: Técnicos especializados
CREATE TABLE tecnicos_soldadura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_tecnico VARCHAR(100) NOT NULL,
  nivel_certificacion VARCHAR(50) NOT NULL
);

-- Tabla transaccional principal con Foreign Keys
CREATE TABLE procesos_soldadura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_proyecto VARCHAR(120) NOT NULL,
  metodo_id INT NOT NULL,
  tecnico_id INT NOT NULL,
  stock_material_kg DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo', 'mantenimiento', 'completado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_proceso_metodo FOREIGN KEY (metodo_id) REFERENCES metodos_soldadura(id),
  CONSTRAINT fk_proceso_tecnico FOREIGN KEY (tecnico_id) REFERENCES tecnicos_soldadura(id)
);