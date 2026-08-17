-- Campuslands MySQL - avanzado ejercicio 020
-- Resolucion: maria-montepeque
-- Tema: estudio de tatuajes
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_avanzado;
DROP TABLE IF EXISTS clientes_avanzado;

CREATE TABLE clientes_avanzado (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  telefono VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE citas_avanzado (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  tatuador VARCHAR(80) NOT NULL,
  estilo ENUM('tradicional','realismo','blackwork','acuarela','minimalista','japones') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  fecha_cita DATE NOT NULL,
  hora_cita TIME NOT NULL,
  estado ENUM('agendada','realizada','cancelada') NOT NULL DEFAULT 'agendada',
  CONSTRAINT fk_citas_avanzado_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_avanzado (id_cliente),
  CONSTRAINT chk_citas_avanzado_precio CHECK (precio > 0)
);

-- Indice UNICO: evita que un mismo tatuador quede reservado dos veces
-- en la misma fecha y hora (regla de negocio impuesta por el indice).
CREATE UNIQUE INDEX uq_citas_avanzado_tatuador_horario
  ON citas_avanzado (tatuador, fecha_cita, hora_cita);

-- Indice compuesto para reportes que filtran por estilo y ordenan por precio.
CREATE INDEX idx_citas_avanzado_estilo_precio
  ON citas_avanzado (estilo, precio);

-- Indice simple para reportes que filtran por rango de fechas sin importar el tatuador.
CREATE INDEX idx_citas_avanzado_fecha
  ON citas_avanzado (fecha_cita);
