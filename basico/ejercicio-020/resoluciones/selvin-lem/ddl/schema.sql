-- Ejercicio 020 - SELECT para estudio de tatuajes
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_tatuajes;

CREATE TABLE citas_tatuajes (
  id_cita INT AUTO_INCREMENT,
  nombre_cliente VARCHAR(120) NOT NULL,
  estilo ENUM('realismo','tradicional','minimalista','blackwork','acuarela') NOT NULL,
  zona_cuerpo VARCHAR(60) NOT NULL,
  horas_estimadas DECIMAL(4,1) NOT NULL,
  costo_total DECIMAL(8,2) NOT NULL,
  estado ENUM('agendada','completada','cancelada') NOT NULL DEFAULT 'agendada',
  fecha_cita DATE NOT NULL,
  CONSTRAINT pk_cita_tatuaje PRIMARY KEY (id_cita),
  CONSTRAINT chk_020_horas_validas CHECK (horas_estimadas > 0),
  CONSTRAINT chk_020_costo_valido CHECK (costo_total >= 0)
);
