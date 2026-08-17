-- Campuslands MySQL - avanzado ejercicio 030
-- Resolucion: maria-montepeque
-- Tema: equipo de streaming
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS eventos_chat_avanzado;

CREATE TABLE eventos_chat_avanzado (
  id_evento INT AUTO_INCREMENT PRIMARY KEY,
  streamer VARCHAR(80) NOT NULL,
  usuario VARCHAR(80) NOT NULL,
  tipo_evento ENUM('mensaje','suscripcion','donacion','ban') NOT NULL,
  fecha DATETIME NOT NULL
);

-- A proposito NO se crea todavia ningun indice sobre "streamer":
-- este ejercicio mide el costo real de consultar sin indice y
-- despues el impacto real de agregarlo (ver dml/inserts.sql y
-- dql/consultas.sql).
