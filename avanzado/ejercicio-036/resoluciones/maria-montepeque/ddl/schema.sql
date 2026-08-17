-- Campuslands MySQL - avanzado ejercicio 036
-- Resolucion: maria-montepeque
-- Tema: autos hiperdeportivos
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS encargos_avanzado;

CREATE TABLE encargos_avanzado (
  id_encargo INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(60) NOT NULL,
  cliente VARCHAR(120) NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  fecha_encargo DATE NOT NULL,
  estado ENUM('pendiente','en_produccion','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_encargos_avanzado_precio CHECK (precio > 0)
);

-- Indice compuesto para busquedas por marca y rango de fechas.
CREATE INDEX idx_encargos_avanzado_marca_fecha ON encargos_avanzado (marca, fecha_encargo);

-- Indice simple para reportes por cliente.
CREATE INDEX idx_encargos_avanzado_cliente ON encargos_avanzado (cliente);
