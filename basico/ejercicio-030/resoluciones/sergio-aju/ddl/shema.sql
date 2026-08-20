CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de llaves foráneas
DROP TABLE IF EXISTS dispositivos_streaming;
DROP TABLE IF EXISTS marcas_streaming;

-- 1. Tabla Padre: Marcas de Equipos de Streaming
CREATE TABLE marcas_streaming (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_marca VARCHAR(80) NOT NULL UNIQUE,
  pais_origen VARCHAR(60) NOT NULL,
  sitio_web VARCHAR(150) DEFAULT NULL
);

-- 2. Tabla Hija: Dispositivos de Streaming (Relación Uno a Muchos con Marcas)
CREATE TABLE dispositivos_streaming (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_dispositivo VARCHAR(100) NOT NULL,
  marca_id INT NOT NULL,
  tipo_dispositivo ENUM('Microfono', 'Camara', 'Iluminacion', 'Capturadora', 'Stream Deck') NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  estado ENUM('disponible', 'agotado', 'descontinuado') NOT NULL DEFAULT 'disponible',
  CONSTRAINT fk_dispositivo_marca FOREIGN KEY (marca_id) REFERENCES marcas_streaming(id) ON DELETE RESTRICT,
  CONSTRAINT chk_precio_streaming CHECK (precio_unitario > 0.00),
  CONSTRAINT chk_stock_streaming CHECK (stock >= 0)
);