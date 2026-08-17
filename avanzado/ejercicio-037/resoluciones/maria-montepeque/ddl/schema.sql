-- Campuslands MySQL - avanzado ejercicio 037
-- Resolucion: maria-montepeque
-- Tema: liga de futbol
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vw_goles_penal_jugados_avanzado;
DROP VIEW IF EXISTS vw_resumen_partidos_avanzado;
DROP VIEW IF EXISTS vw_partidos_jugados_avanzado;
DROP TABLE IF EXISTS goles_avanzado;
DROP TABLE IF EXISTS partidos_avanzado;

CREATE TABLE partidos_avanzado (
  id_partido INT AUTO_INCREMENT PRIMARY KEY,
  equipo_local VARCHAR(60) NOT NULL,
  equipo_visitante VARCHAR(60) NOT NULL,
  fecha_partido DATE NOT NULL,
  estadio VARCHAR(80) NOT NULL,
  estado ENUM('programado','jugado','suspendido') NOT NULL DEFAULT 'programado'
);

CREATE TABLE goles_avanzado (
  id_gol INT AUTO_INCREMENT PRIMARY KEY,
  id_partido INT NOT NULL,
  jugador VARCHAR(80) NOT NULL,
  equipo VARCHAR(60) NOT NULL,
  minuto INT NOT NULL,
  tipo_gol ENUM('normal','penal','autogol') NOT NULL DEFAULT 'normal',
  CONSTRAINT fk_goles_avanzado_partido FOREIGN KEY (id_partido) REFERENCES partidos_avanzado (id_partido),
  CONSTRAINT chk_goles_avanzado_minuto CHECK (minuto BETWEEN 1 AND 120)
);

-- ===================================================================
-- Vista 1: vista simple y actualizable (una sola tabla, sin agregacion)
-- con WITH CHECK OPTION. Cualquier UPDATE/INSERT hecho A TRAVES de esta
-- vista debe seguir cumpliendo estado = 'jugado' despues del cambio;
-- si no, MySQL rechaza la operacion.
-- ===================================================================
CREATE VIEW vw_partidos_jugados_avanzado AS
SELECT id_partido, equipo_local, equipo_visitante, fecha_partido, estadio, estado
FROM partidos_avanzado
WHERE estado = 'jugado'
WITH CHECK OPTION;

-- ===================================================================
-- Vista 2: vista de reporte con JOIN + agregacion (no es actualizable,
-- solo de lectura, pero encapsula un calculo que de otra forma habria
-- que repetir en cada consulta).
-- ===================================================================
CREATE VIEW vw_resumen_partidos_avanzado AS
SELECT p.id_partido,
       p.equipo_local,
       p.equipo_visitante,
       p.fecha_partido,
       COUNT(g.id_gol) AS total_goles,
       SUM(CASE WHEN g.tipo_gol = 'penal' THEN 1 ELSE 0 END) AS goles_penal,
       SUM(CASE WHEN g.tipo_gol = 'autogol' THEN 1 ELSE 0 END) AS autogoles
FROM partidos_avanzado p
LEFT JOIN goles_avanzado g ON g.id_partido = p.id_partido
GROUP BY p.id_partido, p.equipo_local, p.equipo_visitante, p.fecha_partido;

-- ===================================================================
-- Vista 3: vista anidada, construida SOBRE otra vista
-- (vw_partidos_jugados_avanzado), no directamente sobre la tabla.
-- ===================================================================
CREATE VIEW vw_goles_penal_jugados_avanzado AS
SELECT pj.equipo_local, pj.equipo_visitante, pj.fecha_partido, g.jugador, g.equipo, g.minuto
FROM vw_partidos_jugados_avanzado pj
INNER JOIN goles_avanzado g ON g.id_partido = pj.id_partido
WHERE g.tipo_gol = 'penal';
