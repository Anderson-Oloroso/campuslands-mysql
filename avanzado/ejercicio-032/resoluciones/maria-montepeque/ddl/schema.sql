-- Campuslands MySQL - avanzado ejercicio 032
-- Resolucion: maria-montepeque
-- Tema: ranking battle royale
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidas_avanzado;
DROP TABLE IF EXISTS jugadores_avanzado;

CREATE TABLE jugadores_avanzado (
  id_jugador INT AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(60) NOT NULL UNIQUE,
  plataforma ENUM('PC','PS5','Xbox','Mobile') NOT NULL,
  puntos_temporada INT NOT NULL DEFAULT 0,
  CONSTRAINT chk_jugadores_avanzado_puntos CHECK (puntos_temporada >= 0)
) ENGINE=InnoDB;

CREATE TABLE partidas_avanzado (
  id_partida INT AUTO_INCREMENT PRIMARY KEY,
  id_jugador INT NOT NULL,
  posicion_final INT NOT NULL,
  kills INT NOT NULL,
  puntos_obtenidos INT NOT NULL,
  fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_partidas_avanzado_jugador FOREIGN KEY (id_jugador) REFERENCES jugadores_avanzado (id_jugador),
  CONSTRAINT chk_partidas_avanzado_posicion CHECK (posicion_final > 0),
  CONSTRAINT chk_partidas_avanzado_kills CHECK (kills >= 0)
) ENGINE=InnoDB;

-- ===================================================================
-- Procedimiento 1: registra una partida y calcula los puntos segun
-- las reglas del ranking (posicion + kills), sumandolos de forma
-- atomica al total del jugador dentro de la misma transaccion.
--
-- Reglas de puntaje:
--   posicion 1  -> 20 puntos base
--   posicion 2-5 -> 10 puntos base
--   posicion 6-10 -> 5 puntos base
--   posicion 11+  -> 1 punto base
--   + 1 punto extra por cada kill
-- ===================================================================
DROP PROCEDURE IF EXISTS sp_registrar_partida_br;

DELIMITER $$

CREATE PROCEDURE sp_registrar_partida_br (
  IN p_id_jugador INT,
  IN p_posicion_final INT,
  IN p_kills INT
)
BEGIN
  DECLARE v_puntos_base INT;
  DECLARE v_puntos_totales INT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  IF p_posicion_final = 1 THEN
    SET v_puntos_base = 20;
  ELSEIF p_posicion_final BETWEEN 2 AND 5 THEN
    SET v_puntos_base = 10;
  ELSEIF p_posicion_final BETWEEN 6 AND 10 THEN
    SET v_puntos_base = 5;
  ELSE
    SET v_puntos_base = 1;
  END IF;

  SET v_puntos_totales = v_puntos_base + p_kills;

  START TRANSACTION;

  INSERT INTO partidas_avanzado (id_jugador, posicion_final, kills, puntos_obtenidos)
  VALUES (p_id_jugador, p_posicion_final, p_kills, v_puntos_totales);

  UPDATE jugadores_avanzado
  SET puntos_temporada = puntos_temporada + v_puntos_totales
  WHERE id_jugador = p_id_jugador;

  COMMIT;
END$$

DELIMITER ;

-- ===================================================================
-- Procedimiento 2: ranking de los N jugadores con mas puntos.
-- ===================================================================
DROP PROCEDURE IF EXISTS sp_top_jugadores_br;

DELIMITER $$

CREATE PROCEDURE sp_top_jugadores_br (IN p_limite INT)
BEGIN
  SELECT nickname, plataforma, puntos_temporada
  FROM jugadores_avanzado
  ORDER BY puntos_temporada DESC
  LIMIT p_limite;
END$$

DELIMITER ;

-- ===================================================================
-- Procedimiento 3: resumen de un jugador especifico (partidas
-- jugadas, kills totales, victorias y puntos).
-- ===================================================================
DROP PROCEDURE IF EXISTS sp_resumen_jugador_br;

DELIMITER $$

CREATE PROCEDURE sp_resumen_jugador_br (IN p_nickname VARCHAR(60))
BEGIN
  SELECT j.nickname,
         COUNT(p.id_partida) AS partidas_jugadas,
         COALESCE(SUM(p.kills), 0) AS kills_totales,
         COUNT(CASE WHEN p.posicion_final = 1 THEN 1 END) AS victorias,
         j.puntos_temporada
  FROM jugadores_avanzado j
  LEFT JOIN partidas_avanzado p ON p.id_jugador = j.id_jugador
  WHERE j.nickname = p_nickname
  GROUP BY j.nickname, j.puntos_temporada;
END$$

DELIMITER ;
