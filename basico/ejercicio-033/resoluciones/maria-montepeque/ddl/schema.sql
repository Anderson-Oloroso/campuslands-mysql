-- Campuslands MySQL - basico ejercicio 033
-- Resolucion: maria-montepeque
-- Tema: inventario de skins shooter
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS skins_basico;

-- Se usa el codigo del skin (clave natural, estilo codigo de catalogo)
-- como PRIMARY KEY, en vez de un id autoincremental, para practicar
-- una llave primaria con significado de negocio.
CREATE TABLE skins_basico (
  codigo_skin CHAR(8) NOT NULL,
  nombre_skin VARCHAR(120) NOT NULL,
  arma VARCHAR(60) NOT NULL,
  rareza ENUM('comun','poco_comun','raro','epico','legendario') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  coleccion VARCHAR(80) NOT NULL,
  PRIMARY KEY (codigo_skin),
  CONSTRAINT chk_skins_basico_precio CHECK (precio > 0)
);
