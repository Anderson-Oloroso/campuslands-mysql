-- Campuslands MySQL - avanzado ejercicio 021
-- Resolucion: maria-montepeque
-- Tema: dibujo digital
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS encargos_avanzado;

CREATE TABLE encargos_avanzado (
  id_encargo INT AUTO_INCREMENT PRIMARY KEY,
  artista VARCHAR(120) NOT NULL,
  cliente VARCHAR(120) NOT NULL,
  tipo_arte ENUM('ilustracion','concept_art','pixel_art','animacion','comic') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  fecha_encargo DATE NOT NULL,
  estado ENUM('pendiente','en_progreso','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_encargos_avanzado_precio CHECK (precio > 0)
);

-- Indice compuesto para busquedas por artista y rango de fechas.
CREATE INDEX idx_encargos_avanzado_artista_fecha ON encargos_avanzado (artista, fecha_encargo);

-- Indice simple para busquedas y reportes por tipo de arte.
CREATE INDEX idx_encargos_avanzado_tipo_arte ON encargos_avanzado (tipo_arte);
