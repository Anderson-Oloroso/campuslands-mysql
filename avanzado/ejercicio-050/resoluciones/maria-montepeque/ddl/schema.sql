-- Campuslands MySQL - avanzado ejercicio 050
-- Resolucion: maria-montepeque
-- Tema: estudio de tatuajes
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_estudio_avanzado;
DROP TABLE IF EXISTS clientes_estudio_avanzado;

CREATE TABLE clientes_estudio_avanzado (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  telefono VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE citas_estudio_avanzado (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  tatuador VARCHAR(80) NOT NULL,
  estilo ENUM('tradicional','realismo','blackwork','acuarela','minimalista') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_cita DATE NOT NULL,
  hora_cita TIME NOT NULL,
  estado ENUM('agendada','realizada','cancelada') NOT NULL DEFAULT 'agendada',
  CONSTRAINT fk_citas_estudio_avanzado_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_estudio_avanzado (id_cliente),
  CONSTRAINT chk_citas_estudio_avanzado_costo CHECK (costo > 0)
);

-- Indice UNICO: evita que un mismo tatuador quede reservado dos veces
-- en la misma fecha y hora (regla de negocio impuesta por el indice).
CREATE UNIQUE INDEX uq_citas_estudio_avanzado_tatuador_horario
  ON citas_estudio_avanzado (tatuador, fecha_cita, hora_cita);

-- Indice compuesto para reportes que filtran por estilo y ordenan por costo.
CREATE INDEX idx_citas_estudio_avanzado_estilo_costo
  ON citas_estudio_avanzado (estilo, costo);

-- Indice simple para reportes que filtran por rango de fechas sin importar el tatuador.
CREATE INDEX idx_citas_estudio_avanzado_fecha
  ON citas_estudio_avanzado (fecha_cita);
