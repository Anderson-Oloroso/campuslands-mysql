-- Campuslands MySQL - intermedio ejercicio 046
-- Resolucion: maria-montepeque
-- Tema: restaurante de comida urbana
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS combos_intermedio;
DROP TABLE IF EXISTS platos_intermedio;

CREATE TABLE platos_intermedio (
  id_plato INT AUTO_INCREMENT PRIMARY KEY,
  nombre_plato VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('entrada','plato_fuerte','postre','bebida','acompanamiento') NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  CONSTRAINT chk_platos_intermedio_precio CHECK (precio > 0)
);

-- Dos FOREIGN KEY hacia la MISMA tabla: cada combo empareja un plato
-- principal con un acompañamiento. Para leerlo hay que unir
-- platos_intermedio dos veces, con un alias distinto cada vez.
CREATE TABLE combos_intermedio (
  id_combo INT AUTO_INCREMENT PRIMARY KEY,
  nombre_combo VARCHAR(120) NOT NULL UNIQUE,
  id_plato_principal INT NOT NULL,
  id_plato_acompanamiento INT NOT NULL,
  precio_combo DECIMAL(8,2) NOT NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT fk_combos_intermedio_principal FOREIGN KEY (id_plato_principal) REFERENCES platos_intermedio (id_plato),
  CONSTRAINT fk_combos_intermedio_acompanamiento FOREIGN KEY (id_plato_acompanamiento) REFERENCES platos_intermedio (id_plato),
  CONSTRAINT chk_combos_intermedio_precio CHECK (precio_combo > 0),
  CONSTRAINT chk_combos_intermedio_distintos CHECK (id_plato_principal <> id_plato_acompanamiento)
);
