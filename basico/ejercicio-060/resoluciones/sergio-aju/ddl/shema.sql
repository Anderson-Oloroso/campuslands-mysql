CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminación previa para garantizar ejecución limpia desde cero
DROP TABLE IF EXISTS equipos_streaming;
DROP TABLE IF EXISTS marcas_streaming;

-- Entidad 1: Marcas / Fabricantes de equipos de streaming
CREATE TABLE marcas_streaming (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_marca VARCHAR(50) NOT NULL UNIQUE,
  pais_origen VARCHAR(50) NOT NULL,
  CONSTRAINT chk_nombre_marca CHECK (LENGTH(nombre_marca) > 0)
);

-- Entidad 2: Equipos de streaming (Relacionada con Marcas mediante FK)
CREATE TABLE equipos_streaming (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_equipo VARCHAR(20) NOT NULL UNIQUE,
  nombre_dispositivo VARCHAR(100) NOT NULL,
  id_marca INT NOT NULL,
  tipo_equipo ENUM('Microfono', 'Camara', 'Iluminacion', 'Capturadora', 'Stream Deck') NOT NULL,
  precio_usd DECIMAL(10,2) NOT NULL,
  estado_operativo ENUM('activo', 'en_reparacion', 'retirado', 'nuevo') NOT NULL DEFAULT 'nuevo',
  
  -- Restricción de integridad referencial
  CONSTRAINT fk_equipo_marca FOREIGN KEY (id_marca) REFERENCES marcas_streaming(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT chk_precio_streaming CHECK (precio_usd >= 0.00)
);