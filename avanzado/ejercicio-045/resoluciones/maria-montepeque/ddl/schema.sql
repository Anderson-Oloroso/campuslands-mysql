-- Campuslands MySQL - avanzado ejercicio 045
-- Resolucion: maria-montepeque
-- Tema: biblioteca gamer
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS actividad_biblioteca_avanzado;

CREATE TABLE actividad_biblioteca_avanzado (
  id_actividad INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(80) NOT NULL,
  juego VARCHAR(80) NOT NULL,
  tipo_actividad ENUM('inicio_sesion','logro_desbloqueado','compra','resena') NOT NULL,
  fecha DATETIME NOT NULL
);

-- A proposito NO se crea todavia ningun indice sobre "usuario":
-- este ejercicio mide el costo real de consultar sin indice y
-- despues el impacto real de agregarlo (ver dml/inserts.sql y
-- dql/consultas.sql).
