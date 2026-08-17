-- Campuslands MySQL - intermedio ejercicio 045
-- Resolucion: maria-montepeque
-- Tema: biblioteca gamer
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS usuarios_intermedio;
DROP TABLE IF EXISTS usuarios_staging_intermedio;

-- Tabla de staging: aterrizan los datos "crudos" tal como llegarian
-- de un archivo externo (CSV, export de otra plataforma, etc.). Todo
-- es texto y no hay restricciones, porque en esta etapa los datos
-- pueden venir con espacios, mayusculas inconsistentes o duplicados.
CREATE TABLE usuarios_staging_intermedio (
  nombre_usuario VARCHAR(150),
  plataforma VARCHAR(80),
  juegos_totales VARCHAR(50),
  pais VARCHAR(80)
);

-- Tabla final, limpia: aqui si aplican los tipos y restricciones
-- correctas, porque solo debe llegar informacion ya validada.
CREATE TABLE usuarios_intermedio (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre_usuario VARCHAR(150) NOT NULL UNIQUE,
  plataforma ENUM('pc','playstation','xbox','switch','movil') NOT NULL,
  juegos_totales INT NOT NULL,
  pais VARCHAR(80) NOT NULL,
  CONSTRAINT chk_usuarios_intermedio_juegos CHECK (juegos_totales >= 0)
);
