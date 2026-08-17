CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
  id_auto INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(40) NOT NULL,
  modelo VARCHAR(60) NOT NULL,
  potencia_hp SMALLINT UNSIGNED NOT NULL,
  velocidad_max SMALLINT UNSIGNED NOT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  fecha_lanzamiento DATE NOT NULL,
  estado ENUM('disponible','agotado','preventa') NOT NULL DEFAULT 'disponible'
);