-- Campuslands MySQL - avanzado ejercicio 035
-- Resolucion: maria-montepeque
-- Tema: taller mecanico de motos
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_taller_avanzado;
DROP TABLE IF EXISTS clientes_taller_avanzado;

CREATE TABLE clientes_taller_avanzado (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  telefono VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE citas_taller_avanzado (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  mecanico VARCHAR(80) NOT NULL,
  tipo_servicio ENUM('mantenimiento','reparacion','cambio_aceite','revision_general','personalizacion') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_cita DATE NOT NULL,
  hora_cita TIME NOT NULL,
  estado ENUM('agendada','realizada','cancelada') NOT NULL DEFAULT 'agendada',
  CONSTRAINT fk_citas_taller_avanzado_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_taller_avanzado (id_cliente),
  CONSTRAINT chk_citas_taller_avanzado_costo CHECK (costo > 0)
);

-- Indice UNICO: evita que un mismo mecanico quede reservado dos veces
-- en la misma fecha y hora (regla de negocio impuesta por el indice).
CREATE UNIQUE INDEX uq_citas_taller_avanzado_mecanico_horario
  ON citas_taller_avanzado (mecanico, fecha_cita, hora_cita);

-- Indice compuesto para reportes que filtran por tipo de servicio y ordenan por costo.
CREATE INDEX idx_citas_taller_avanzado_tipo_costo
  ON citas_taller_avanzado (tipo_servicio, costo);

-- Indice simple para reportes que filtran por rango de fechas sin importar el mecanico.
CREATE INDEX idx_citas_taller_avanzado_fecha
  ON citas_taller_avanzado (fecha_cita);
