CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_obtener_ranking;
DROP PROCEDURE IF EXISTS sp_obtener_estadisticas_jugador;
DROP PROCEDURE IF EXISTS sp_registrar_partida;

DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    rango VARCHAR(30) NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_jugador_puntaje
        CHECK (puntaje >= 0)
);

CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    posicion_final INT NOT NULL,
    eliminaciones INT NOT NULL DEFAULT 0,
    fecha_partida DATE NOT NULL,

    CONSTRAINT fk_partida_jugador
        FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_posicion_final
        CHECK (posicion_final > 0),

    CONSTRAINT chk_eliminaciones
        CHECK (eliminaciones >= 0)
);


DELIMITER $$

CREATE PROCEDURE sp_obtener_ranking()
BEGIN
    SELECT
        j.id_jugador,
        j.nickname AS jugador,
        j.rango,
        j.puntaje,
        COUNT(p.id_partida) AS partidas_jugadas,
        COALESCE(SUM(p.eliminaciones), 0) AS eliminaciones_totales
    FROM jugadores AS j
    LEFT JOIN partidas AS p
        ON j.id_jugador = p.id_jugador
    WHERE j.estado = 'activo'
    GROUP BY
        j.id_jugador,
        j.nickname,
        j.rango,
        j.puntaje
    ORDER BY
        j.puntaje DESC,
        eliminaciones_totales DESC;
END$$


CREATE PROCEDURE sp_obtener_estadisticas_jugador(
    IN p_id_jugador INT
)
BEGIN
    SELECT
        j.id_jugador,
        j.nickname AS jugador,
        j.rango,
        j.puntaje,
        COUNT(p.id_partida) AS partidas_jugadas,
        COALESCE(SUM(p.eliminaciones), 0) AS eliminaciones_totales,
        ROUND(AVG(p.posicion_final), 2) AS promedio_posicion
    FROM jugadores AS j
    LEFT JOIN partidas AS p
        ON j.id_jugador = p.id_jugador
    WHERE j.id_jugador = p_id_jugador
    GROUP BY
        j.id_jugador,
        j.nickname,
        j.rango,
        j.puntaje;
END$$


CREATE PROCEDURE sp_registrar_partida(
    IN p_id_jugador INT,
    IN p_posicion_final INT,
    IN p_eliminaciones INT,
    IN p_fecha_partida DATE
)
BEGIN
    INSERT INTO partidas (
        id_jugador,
        posicion_final,
        eliminaciones,
        fecha_partida
    )
    VALUES (
        p_id_jugador,
        p_posicion_final,
        p_eliminaciones,
        p_fecha_partida
    );
END$$

DELIMITER ;