-- Campuslands MySQL - basico ejercicio 044
-- Resolucion: maria-montepeque
-- Tema: saga de ciencia ficcion
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_saga_basico;

CREATE TABLE peliculas_saga_basico (
  id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  episodio INT NOT NULL,
  presupuesto DECIMAL(12,2) NOT NULL,
  fecha_inicio_rodaje DATE NOT NULL,
  fecha_estreno DATE NOT NULL,
  estado ENUM('en_produccion','post_produccion','estrenada','cancelada') NOT NULL DEFAULT 'en_produccion',
  CONSTRAINT chk_peliculas_saga_basico_presupuesto CHECK (presupuesto > 0),
  CONSTRAINT chk_peliculas_saga_basico_fechas CHECK (fecha_estreno >= fecha_inicio_rodaje)
);
