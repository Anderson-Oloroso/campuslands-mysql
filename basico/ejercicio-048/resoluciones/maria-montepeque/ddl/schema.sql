-- Campuslands MySQL - basico ejercicio 048
-- Resolucion: maria-montepeque
-- Tema: viajes y turismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS paquetes_turisticos_basico;

-- Se usa el codigo del paquete (clave natural, estilo codigo de
-- catalogo) como PRIMARY KEY, en vez de un id autoincremental, para
-- practicar una llave primaria con significado de negocio.
CREATE TABLE paquetes_turisticos_basico (
  codigo_paquete CHAR(8) NOT NULL,
  nombre_paquete VARCHAR(120) NOT NULL,
  destino VARCHAR(80) NOT NULL,
  categoria ENUM('playa','montana','ciudad','aventura','crucero') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  duracion_dias INT NOT NULL,
  PRIMARY KEY (codigo_paquete),
  CONSTRAINT chk_paquetes_turisticos_basico_precio CHECK (precio > 0),
  CONSTRAINT chk_paquetes_turisticos_basico_duracion CHECK (duracion_dias > 0)
);
